describe_recipe "couchbase::server" do
  include MiniTest::Chef::Assertions
  include MiniTest::Chef::Context
  include MiniTest::Chef::Resources

  MiniTest::Chef::Resources.register_resource :couchbase_cluster, :username, :password
  MiniTest::Chef::Resources.register_resource :couchbase_node, :username, :password

  describe "couchbase-server service" do
    let(:couchbase_server) { service "couchbase-server" }

    it "starts on boot" do
      couchbase_server.must_be_enabled
    end

    it "is running as a daemon" do
      couchbase_server.must_be_running
    end
  end

  describe "log directory" do
    let(:log_dir) { directory node['couchbase']['server']['log_dir'] }

    it "exists" do
      log_dir.must_exist
    end

    it "is owned by couchbase" do
      log_dir.with :owner, "couchbase"
      log_dir.with :group, "couchbase"
    end
  end

  describe "static_config" do
    let(:static_config) { file File.join(node['couchbase']['server']['install_dir'], 'etc', 'couchbase', 'static_config') }

    it "moves the log directory" do
      static_config.must_include %{{error_logger_mf_dir, "#{node['couchbase']['server']['log_dir']}"}.}
      static_config.wont_match /error_logger_mf_dir.*error_logger_mf_dir/
    end
  end

  describe "database directory" do
    let(:database_dir) { directory node['couchbase']['server']['database_path'] }

    it "exists" do
      database_dir.must_exist
    end

    it "is owned by couchbase" do
      database_dir.with :owner, "couchbase"
      database_dir.with :group, "couchbase"
    end
  end

  describe "self Couchbase node" do
    let(:node_self) do
      couchbase_node("self", {
        :username => node["couchbase"]["server"]["username"],
        :password => node["couchbase"]["server"]["password"],
      })
    end

    it "has its database path configured" do
      node_self.must_have :database_path, node["couchbase"]["server"]["database_path"]
    end
  end

  describe "default Couchbase cluster" do
    let(:cluster) do
      couchbase_cluster("default", {
        :username => node["couchbase"]["server"]["username"],
        :password => node["couchbase"]["server"]["password"],
      })
    end

    it "exists" do
      assert cluster.exists
    end

    it "has its memory quota configured" do
      cluster.must_have :memory_quota_mb, node["couchbase"]["server"]["memory_quota_mb"]
    end
  end
end
