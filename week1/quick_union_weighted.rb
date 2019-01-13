class QuickUnionWeighted
  attr_reader :arr, :depth

  def initialize(n)
    @arr = Array.new(n, &:to_i)

    @depth = Array.new(n, 1)

    self
  end

  def union(p, q)
    root_p = root(p)
    root_q = root(q)

    return if root_p == root_q

    if @depth[root_p] < @depth[root_q]
      @arr[root_p] = @arr[root_q]

      @depth[root_q] += @depth[root_p]
    else
      @arr[root_q] = @arr[root_p]

      @depth[root_p] += @depth[root_q]
    end

    self
  end

  def connected?(p, q)
    @arr[root(p)] == @arr[root(q)]
  end

  private

  def root(x)
    loop do
      break x if @arr[x] == x

      x = @arr[x]
    end
  end
end
