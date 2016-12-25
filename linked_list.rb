class LinkedList
  attr_accessor :name, :count, :head
  def initialize
    @head = nil #node

    @count = 0
  end

  def append(node)
    if @head.nil?
      @head = node
      @count += 1
    else
      nodenew = node.clone
      elem = @head
      until elem.next == nil
      elem = elem.next
      end
      elem.next = nodenew
      @count += 1
    end

  end

  def prepend(node)
    if @head.nil?
      @head = node
      @count += 1
    else
      nodenew = node.clone
      nodenew.next = @head
      @head = nodenew
      @count += 1
    end

  end

  def size
    if @head.nil?
      return 0
    else
      @count
    end
  end

  def head
    @head.value
  end

  def tail
    elem = @head
    until elem.next == nil
      elem = elem.next
    end
    return elem.value
  end

  def at(index)
      if @head.nil? || index >= @count
        return "wrong val"
      else
        elem = @head
        if index == 0
          return elem.value
        else
          i = 0
        while i < index
          elem = elem.next
          i +=1
        end
        return elem.value
        end
      end
  end

  def pop
    if @head.nil?
      return nil
    end
    elem = @head
    until elem.next.next == nil
      elem = elem.next
    end
      result = elem.next
      elem.next = nil
      @count -=1
    return result.value

  end

  def contains?(val)
    if @head.nil?
      return nil
    end
    result = false
    elem = @head
    if elem.value == val
      result = true
    end
    until elem.next == nil
      elem = elem.next
      if elem.value == val
        result = true
      end
    end
    result
  end

  def find(data)
    elem = @head
    i = 0
    if !self.contains? data
      return nil
    end
    until elem.next == nil
      if elem.value == data
        break
      end
      elem = elem.next
      i += 1
    end
    i
  end

  def to_s
    result = "#{@head.value} "
    elem = @head

    until elem.next == nil
      elem = elem.next
      result += "#{elem.value} "
    end
    result += "nil"
  end

  def insert_at(index, node)
    if @head.nil? || index >= @count+1
      return "wrong val"

    else
    nodenew = node.clone
    elem = @head
      if index == 0
        self.prepend node
      else
        i = 0
        while i < index-1
          elem = elem.next
          i +=1
        end
        nodenew.next = elem.next
        elem.next = nodenew
        @count += 1
      end
    end
  end
  def remove_at(index)
    if @head.nil? || index >= @count
      return "wrong val"
    end
    if index == count-1
      self.pop
    elsif index == 0
      @head = @head.next
    else
      elem = @head
      i =0
      while i < index-1
        elem = elem.next
        i += 1
      end
        elem.next = elem.next.next
    end
  end
end

class Node
  attr_accessor :value, :next
  def initialize(value= nil)
    @value = value
    @next = nil
  end
end

list = LinkedList.new
node1 = Node.new(2)
node2 = Node.new(123)
node3 = Node.new(32)
node4 = Node.new(108)
    node5 = Node.new(97)
list.append node1 #1
list.append node2 #2
list.append node3 #3
list.append node5 #4
list.append node3 #5
list.prepend node4 #0
