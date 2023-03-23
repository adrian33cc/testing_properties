defmodule MaxTest do
  use ExUnit.Case, async: true
  # use ExCheck
  use ExUnitProperties
  require Max

  property "el resultado es mayor o igual que ambos numeros" do
     check all a <- integer(),
          b <- integer() do
      assert Max.max(a, b) >= a
      assert Max.max(a, b) >= b
    end
  end

  property "el resultado es uno de los dos numeros" do
    check all a <- integer(),
          b <- integer() do
      max = Max.max(a, b)
      assert max == a or max == b
    end
  end

  property "el resultado es el mismo sin importar el orden de entrada" do
     check all a <- integer(),
          b <- integer() do
      assert Max.max(a, b) == Max.max(b, a)
    end
  end

end
