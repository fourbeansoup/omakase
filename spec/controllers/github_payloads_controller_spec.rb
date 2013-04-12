require 'spec_helper'

describe GithubPayloadsController do
  before do
    @payload = double("payload")
    Payload.stub(:create)
  end

  it "should take a post commit webhook with a payload" do
    post :create, :payload => payload(), :format => :json
    response.should be_success
  end

  it "should take a post commit webhook with a payload and create a payload" do
    model_params = payload.stringify_keys
    model_params["commits"].first.stringify_keys!
    Payload.should_receive(:create).with(model_params)
    post :create, :payload => payload(), :format => :json
  end

  def payload
    {commits: [{message: "Test"}]}
    #'{ "after": "50371abb653cb6c9551f155bd097630873d77d4c", "before": "ffe8b3b8e8a12d707235c49885b04ea7e2908ff2", "commits": [ { "added": [], "author": { "email": "joshua.owens@gmail.com", "name": "Josh Owens", "username": "queso" }, "committer": { "email": "joshua.owens@gmail.com", "name": "Josh Owens", "username": "queso" }, "distinct": true, "id": "50371abb653cb6c9551f155bd097630873d77d4c", "message": "Tweak gemspec", "modified": [ "omakase.gemspec" ], "removed": [], "timestamp": "2013-03-12T11:29:30-07:00", "url": "https://github.com/fourbeansoup/omakase/commit/50371abb653cb6c9551f155bd097630873d77d4c" } ], "compare": "https://github.com/fourbeansoup/omakase/compare/ffe8b3b8e8a1...50371abb653c", "created": false, "deleted": false, "forced": false, "head_commit": { "added": [], "author": { "email": "joshua.owens@gmail.com", "name": "Josh Owens", "username": "queso" }, "committer": { "email": "joshua.owens@gmail.com", "name": "Josh Owens", "username": "queso" }, "distinct": true, "id": "50371abb653cb6c9551f155bd097630873d77d4c", "message": "Tweak gemspec", "modified": [ "omakase.gemspec" ], "removed": [], "timestamp": "2013-03-12T11:29:30-07:00", "url": "https://github.com/fourbeansoup/omakase/commit/50371abb653cb6c9551f155bd097630873d77d4c" }, "pusher": { "name": "none" }, "ref": "refs/heads/master", "repository": { "created_at": 1363112739, "description": "A rails engine that tracks noted changes from commit messages to show to customers", "fork": false, "forks": 0, "has_downloads": true, "has_issues": true, "has_wiki": true, "id": 8735130, "language": "Ruby", "master_branch": "master", "name": "omakase", "open_issues": 0, "organization": "fourbeansoup", "owner": { "email": null, "name": "fourbeansoup" }, "private": false, "pushed_at": 1363112977, "size": 112, "stargazers": 0, "url": "https://github.com/fourbeansoup/omakase", "watchers": 0 } }'
  end
end
