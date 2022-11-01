require 'byebug'


class Node
  
  attr_reader :key
  attr_accessor :val, :next, :prev
  
  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end
  
  def to_s
    "#{@key}: #{@val}"
  end
  
  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end

  def inspect
    [@key, @val, @prev]
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    return nil if self.empty?
    @head.next
  end

  def last
    return nil if self.empty?
    @tail.prev
  end

  def empty?
    @head.next.val.nil?
  end

  def get(key)
    self.each do |node|
      return node.val if node.key == key
    end   
    nil
  end

  def include?(key)
    self.each { |node| return true if node.key == key }
    false
  end

  def append(key, val)
    old_last_node = @tail.prev
    new_node = Node.new(key, val)
    
    # Point old_last_node next to new_node
    old_last_node.next = new_node
    # Point new_node prev to old_last_node
    new_node.prev = old_last_node
    
    # link new node to tail
    @tail.prev = new_node
    new_node.next = @tail
  end

  def update(key, val)
    # identifies key and updates its value
    self.each do |node|
      if node.key == key
        node.val = val
        break
      end
    end  
  end

  def remove(key)
    self.each do |node|
      if node.key == key
        node.prev.next = node.next
        node.next.prev = node.prev

        # node.next = nil
        # node.prev = nil

        return true
      end
    end

    false
  end

  def each
    cur_node = @head
    node_arr = []

    until cur_node.next.val.nil?
      # node_arr << cur_node.next
      cur_node = cur_node.next
      yield cur_node
    end

    node_arr
  end

  def render
    res = []
    cur_node = @head
    until node.next.nil?
      cur_node = cur_node.next
      res << cur_node
    end
    cur_node
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end


# { first: 1, second: 2, third: 3 }
# append(key, val)

x = LinkedList.new
x.append(:first, 1)
x.update(:first, 2)
p x