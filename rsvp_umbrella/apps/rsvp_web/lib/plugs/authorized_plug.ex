defmodule RsvpWeb.AuthorizedPlug do
  import Plug.Conn
  import Phoenix.Controller

  def init(opts) do
    opts
  end

  def call(conn, name) do
    user_name = conn.cookies["user_name"]

    authorize_user(conn, user_name, name)
  end

  def authorize_user(conn, nil, _) do
    conn
    |> redirect(to: "/login")
    |> halt
  end

  def authorize_user(conn, user_name, name) when user_name === name do
    conn
  end

  def authorize_user(conn, _, _), do: authorize_user(conn, nil, nil)
end
