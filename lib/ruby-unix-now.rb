
def log(msg, level = 0)
  puts (' ' * (level * 2)) + '# ' + msg
end

def run(*arguments)
  options = (arguments.last.is_a?(Hash) && arguments.pop) || {}
  cmd = expand_cmd(*arguments)
  log(cmd)
  result = if options[:sync]
    `#{cmd}`
  else
    system(cmd)
  end
  unless $?.success?
    exit -1
  end
  result
end

def expand_cmd(*arguments)
  command = arguments.shift.to_s
  cmd = command + ' ' + arguments.map{|a| a.to_cmd_opt}.join(' ')
end

class Symbol
  def to_cmd_opt
    string = to_s
    if string.length == 1
      '-' + string
    else
      '--' + string
    end
  end
end

class Array
  def to_cmd_opt
    map{|a| a.to_cmd_opt}.join(' ')
  end
end

class String
  def to_cmd_opt
    self
  end
end

class Hash
  def to_cmd_opt(style = :gnu)
    map do |key, value| 
      prefix = ((style == :gnu && key.to_s.size > 1) ? '--' : '-')
      assignment = (key.to_s.size == 1 || style == :unix) ? ' ' : '='
      value.is_a?(TrueClass) ? "#{prefix}#{key}" : "#{prefix}#{key}#{assignment}#{value}"
    end.join(' ')
  end
end