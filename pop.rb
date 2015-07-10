
Post.create(user_id: 1, title: "Hard Times Hit Detroit", content: "This year in Detroit the time is now to get on the ball and create a new economic future")
Post.create(user_id: 2, title: "Hard Times Hit Detroit", content: "This year in Detroit the time is now to get on the ball and create a new economic future")
Post.create(user_id: 3, title: "Hard Times Hit Detroit", content: "This year in Detroit the time is now to get on the ball and create a new economic future")
Post.create(user_id: 4, title: "Hard Times Hit Detroit", content: "This year in Detroit the time is now to get on the ball and create a new economic future")
Post.create(user_id: 5, title: "Hard Times Hit Detroit", content: "This year in Detroit the time is now to get on the ball and create a new economic future")
Post.create(user_id: 6, title: "Hard Times Hit Detroit", content: "This year in Detroit the time is now to get on the ball and create a new economic future")
Post.create(user_id: 7, title: "Hard Times Hit Detroit", content: "This year in Detroit the time is now to get on the ball and create a new economic future")
Post.create(user_id: 8, title: "Hard Times Hit Detroit", content: "This year in Detroit the time is now to get on the ball and create a new economic future")
Post.create(user_id: 9, title: "Hard Times Hit Detroit", content: "This year in Detroit the time is now to get on the ball and create a new economic future")
Post.create(user_id: 10, title: "Hard Times Hit Detroit", content: "This year in Detroit the time is now to get on the ball and create a new economic future")

<div class='userlist'>
    <div><strong>blah</strong>.BLAH.<strong>blog</strong>.<span>users :</span>
    </div>
      <ul>
          <% @list.each do |user| %>
        <li>
          <form method="GET" action="<%= "/users/#{user.id}/profiles" %>">
            <input type="submit" value="<%= user.username %>" />
          </form>
        </li>
          <% end %>
      <ul>
    </div>