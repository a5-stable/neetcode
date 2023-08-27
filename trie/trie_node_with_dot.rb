class WordDictionary
    def initialize()
        @root = TrieNode.new
    end
  
  =begin
    :type word: String
    :rtype: Void
  =end
    def add_word(word)
        node = @root
        word.each_char do |char|
            node.children[char] ||= TrieNode.new
            node = node.children[char]
        end
        node.is_end = true
    end
  
  =begin
    :type word: String
    :rtype: Boolean
  =end
    def search(word)
      search_helper(word, @root)
    end
  
    def search_helper(word, node)
      return node.is_end if word.empty?
  
      char = word[0]
      rest_of_word = word[1..-1]
  
      if char == "."
        node.children.values.any? { |v| search_helper(rest_of_word, v) }
      else
        next_node = node.children[char]
        return false unless next_node
        return search_helper(rest_of_word, next_node)
      end
    end
  end
  
  # Your WordDictionary object will be instantiated and called as such:
  # obj = WordDictionary.new()
  # obj.add_word(word)
  # param_2 = obj.search(word)
  
  class TrieNode
    attr_accessor :children, :is_end
  
    def initialize
        @children = {}
        @is_end = false
    end
  end
  