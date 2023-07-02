defmodule ChatterWeb.ChatRoomControllerTest do
  use ChatterWeb.ConnCase, async: true

  describe "create/2" do
    test "renders new page with errors when datat is invalid", %{conn: conn} do
      insert(:chat_room, name: "Elixir")
      params = string_params_for(:chat_room, name: "Elixir")

      response =
        conn
        |> post(~p(/chat_rooms), %{"room" => params})
        |> html_response(200)

      assert response =~ "has already been taken"
    end
  end
end
