require "chef/provider"
require File.join(File.dirname(__FILE__), "client")
require File.join(File.dirname(__FILE__), "cluster_data")

class Chef
  class Provider
    class CouchbaseCluster < Provider
      include Couchbase::Client
      include Couchbase::ClusterData

      def load_current_resource
        @current_resource = Resource::CouchbaseCluster.new @new_resource.name
        @current_resource.cluster @new_resource.cluster
        @current_resource.exists !!pool_data
        @current_resource.memory_quota_mb pool_memory_quota_mb if @current_resource.exists
      end

      def action_create_if_missing
        unless @current_resource.exists
          post "/pools/#{@new_resource.cluster}", "memoryQuota" => @new_resource.memory_quota_mb
          @new_resource.updated_by_last_action true
          Chef::Log.info "#{@new_resource} created"
        end
      end
    end
  end
end
