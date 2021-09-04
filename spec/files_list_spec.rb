require "cucumber-reports/commands"
require "cucumber-reports/ast_parser"
require "json"

RSpec.describe CucumberReports do
  let(:main_script) {  CucumberReports::Commands.new(path: "spec/fixtures/step_definitions") }

  it "should list all .rb files in given directory" do
    expect(
      main_script.files
    ).to eq(
      ["spec/fixtures/step_definitions/from_activeadmin/action_item_steps.rb",
       "spec/fixtures/step_definitions/from_activeadmin/action_link_steps.rb",
       "spec/fixtures/step_definitions/from_activeadmin/additional_web_steps.rb",
       "spec/fixtures/step_definitions/from_activeadmin/asset_steps.rb",
       "spec/fixtures/step_definitions/from_activeadmin/attribute_steps.rb",
       "spec/fixtures/step_definitions/from_activeadmin/attributes_table_title_steps.rb",
       "spec/fixtures/step_definitions/from_activeadmin/batch_action_steps.rb",
       "spec/fixtures/step_definitions/from_activeadmin/blog_steps.rb",
       "spec/fixtures/step_definitions/from_activeadmin/breadcrumb_steps.rb",
       "spec/fixtures/step_definitions/from_activeadmin/column_steps.rb",
       "spec/fixtures/step_definitions/from_activeadmin/comment_steps.rb",
       "spec/fixtures/step_definitions/from_activeadmin/configuration_steps.rb",
       "spec/fixtures/step_definitions/from_activeadmin/dashboard_steps.rb",
       "spec/fixtures/step_definitions/from_activeadmin/factory_steps.rb",
       "spec/fixtures/step_definitions/from_activeadmin/filesystem_steps.rb",
       "spec/fixtures/step_definitions/from_activeadmin/filter_steps.rb",
       "spec/fixtures/step_definitions/from_activeadmin/flash_steps.rb",
       "spec/fixtures/step_definitions/from_activeadmin/footer_steps.rb",
       "spec/fixtures/step_definitions/from_activeadmin/format_steps.rb",
       "spec/fixtures/step_definitions/from_activeadmin/head_steps.rb",
       "spec/fixtures/step_definitions/from_activeadmin/i18n_steps.rb",
       "spec/fixtures/step_definitions/from_activeadmin/index_scope_steps.rb",
       "spec/fixtures/step_definitions/from_activeadmin/index_views_steps.rb",
       "spec/fixtures/step_definitions/from_activeadmin/layout_steps.rb",
       "spec/fixtures/step_definitions/from_activeadmin/member_link_steps.rb",
       "spec/fixtures/step_definitions/from_activeadmin/menu_steps.rb",
       "spec/fixtures/step_definitions/from_activeadmin/meta_tag_steps.rb",
       "spec/fixtures/step_definitions/from_activeadmin/pagination_steps.rb",
       "spec/fixtures/step_definitions/from_activeadmin/root_steps.rb",
       "spec/fixtures/step_definitions/from_activeadmin/sidebar_steps.rb",
       "spec/fixtures/step_definitions/from_activeadmin/site_title_steps.rb",
       "spec/fixtures/step_definitions/from_activeadmin/tab_steps.rb",
       "spec/fixtures/step_definitions/from_activeadmin/table_steps.rb",
       "spec/fixtures/step_definitions/from_activeadmin/user_steps.rb",
       "spec/fixtures/step_definitions/from_activeadmin/web_steps.rb",
       "spec/fixtures/step_definitions/simple/simple.rb",
       "spec/fixtures/step_definitions/with_arguments/with_arguments.rb",
       "spec/fixtures/step_definitions/with_arguments/with_arguments_and_union.rb",
       "spec/fixtures/step_definitions/with_block/simple.rb",
       "spec/fixtures/step_definitions/with_block/with_block.rb"]
    )
  end
end
