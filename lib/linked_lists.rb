class Node
  attr_accessor :value, :next_node

  def initialize(value)
    @value = value
    @next_node = nil
  end
end

class LinkedList
  attr_reader :head

  def initialize(node = nil)
    @head = node
  end

  def append(value)
    current_node = head
    current_node = current_node.next_node until current_node.next_node.nil?
    current_node.next_node = Node.new(value)
  end

  def prepend(value)
    new_head = Node.new(value)
    new_head.next_node = head
    @head = new_head
  end
  
  def size
    current_node = head
    count = current_node.nil? ? 0: 1
    until current_node.next_node.nil?
      current_node = current_node.next_node
      count += 1
    end
    count
  end

  def tail
    return nil if head.nil?

    current_node = head
    until current_node.next_node.nil?
      current_node = current_node.next_node
    end
    current_node
  end

  def at(index)
    return nil if head.nil? || index > size - 1

    current_node = head
    i == 0
    until i == index or current_node.next_node.nil?
      current_node = current_node.next_node
    end
    i == index ? current_node : nil
  end

  def pop
    return nil if head.nil?
    return head if head.next_node.nil?

    current_node = head
    until current_node.next_node.next_node.nil?
      current_node = current_node.next_node
    end
    current_node.next_node = nil
    current_node
  end

  def contains?(value)
    current_node = head
    until current_node.nil?
      return true if current_node.value == value

      current_node = current_node.next_node
    end
    false
  end

  def find(value)
    current_node = head
    i = 0
    until current_node.nil?
      return i if current_node.value == value

      current_node = current_node.next_node
      i += 1
    end
    nil
  end

  def to_s
    str = ""
    current_node = head
    until current_node.nil?
      added_bit = current_node.value.nil? ? "( nil ) -> " : "( #{current_node.value} ) -> "
      str << added_bit
      current_node = current_node.next_node
    end
    str << "nil"
    return str
  end
end

head_node = Node.new(5)
list = LinkedList.new(head_node)
p list.head
list.append(98)
list.append(4)
list.prepend(1)
puts list.to_s
p list.tail
