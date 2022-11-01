require_relative 'p04_linked_list'

class HashMap
  attr_accessor :count
  include Enumerable

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    if include?(key)
      bucket(key).update(key,val)
    else
      resize! if @count >= num_buckets - 1
      bucket(key).append(key,val)
      @count += 1
    end
  end

  def get(key)
    bucket(key).get(key)
  end

  def delete(key)
    if include?(key)
      bucket(key).remove(key)
      @count -= 1
    end
  end

  def each
    # kv_pair_arr = []
    @store.each do |bucket|
      bucket.each { |node| yield [node.key, node.val]}  
    end
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets * 2) { LinkedList.new }

    @store.each do |bucket|
      bucket.each do |node| 
        key, val = node.key, node.val
        new_store[key.hash % new_store.length].append(key, val)
      end
    end

    @store = new_store
  end

  # Returns the bucket corresponding to `key`
  def bucket(key)
    @store[key.hash % num_buckets]
  end
end

# x = LinkedList.new
# x.append(:first, 1)
# x.append(:second, 2)
# p x