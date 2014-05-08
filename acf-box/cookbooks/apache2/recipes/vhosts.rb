#
# Cookbook Name:: apache2
# Recipe:: vhosts
#
# Copyright 2012, Adam Brett. All Rights Reserved.
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
include_recipe "apache2"

web_app "CB203" do
  server_name "CB203-acf.local"
  server_aliases ["CB203-acf.local"]
  allow_override "all"
  docroot "/opt/sites/CB203"
end