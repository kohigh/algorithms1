class QuickUnionCompressionWeighted
  attr_reader :arr, :depth

  def initialize(n)
    @arr = Array.new(n, &:to_i)

    @depth = Array.new(n, 1)

    self
  end

  def union(p, q)
    root_p = root(p)
    root_q = root(q)

    return if root_q == root_p

    @depth[root_p] < @depth[root_q] ? bind_roots(root_p, root_q) : bind_roots(root_q, root_p)

    self
  end

  def connected?(p, q)
    root(p) == root(q)
  end

  private

  def root(x)
    loop do
      break x if @arr[x] == x

      x = @arr[x] = @arr[@arr[x]]
    end
  end

  def bind_roots(smaller, larger)
    @arr[smaller] = @arr[larger]

    @depth[larger] += @depth[smaller]
  end
end