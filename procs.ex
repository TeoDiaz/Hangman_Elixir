defmodule Procs do

  def greeter(count) do
    receive do
      {:add, n} ->
        greeter(count+n)
      msg ->
        IO.puts "#{count}: Hello #{inspect msg}"
        greeter(count)
    end
  end

  # spawn Procs, :greeter, ["world"]
  # MFA is short for Module, Function, Arguments


end
