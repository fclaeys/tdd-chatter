defmodule ChatterWeb.UserCreateNewRoomTest do
  use ChatterWeb.FeatureCase, async: true

  @room_index "/"

  describe "as a user, I want to visit the chat room index and create a new room" do
    test "user visists index and create a new room", %{session: session} do
      session
      |> visit(@room_index)
      |> click(new_chat_link())
      |> create_chat_room(name: "Elixir")
      |> assert_has(room_title("Elixir"))
    end

    defp new_chat_link() do
      Query.link("New chat room")
    end

    defp create_chat_room(session, name: name) do
      session
      |> fill_in(Query.text_field("room_name"), with: name)
      |> click(Query.button("Submit"))
    end

    defp room_title(title) do
      Query.data("role", "room-title", text: title)
    end
  end
end
