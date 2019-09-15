require_relative 'pq2/version'

class Pq2
  def initialize(enumerable = nil)
    raise ArgumentError unless enumerable.nil? || enumerable.respond_to?(:each)
    @heap = []
    @size = 0
    enumerable.each(&method(:push)) if enumerable
  end

  def push(item)
    i = @size
    @size = @size.next
    while i.positive? do
      p = i.pred / 2
      break if @heap[p] <= item
      @heap[i] = @heap[p]
      i = p
    end
    @heap[i] = item
  end

  def pop
    return if empty?

    r = @heap.first
    @size = @size.pred
    x = @heap[@size]
    i = 0
    while (i * 2).next < @size do
      a = (i * 2).next
      b = a.next
      a = b if b < @size && @heap[b] < @heap[a]
      break if @heap[a] >= x
      @heap[i] = @heap[a]
      i = a
    end
    @heap[i] = x
    r
  end

  def first
    @heap.first
  end

  def empty?
    @size.zero?
  end
end
