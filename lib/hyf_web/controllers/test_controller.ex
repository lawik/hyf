defmodule HyfWeb.TestController do
  use HyfWeb, :controller

  def submit(conn, %{"name" => name, "data" => data}) do
    Hyf.Storage.put(name, data)
    conn
  end
end
