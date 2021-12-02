#define edge
edge = Struct.new(:u, :v, :e) {
  def to_s
    "#{u} #{v} #{e}"
  end
}
#define union
def find x, y
  index = y

  while y != x[y]
    y = x[y]
  end
  x[index] = y
  y
end

def union a, x, y
  a[find a, x] = find a, y
end

testcases = gets.to_i
(1..testcases).each {
  line = gets.chomp.split " "
  n = line[0].to_i #Number of vertices
  m = line[1].to_i
  un = []
  edges = []

  for i in 0..(n - 1)
    un << i.to_i
  end

  for i in 0..m - 1
    line = gets.chomp.split " "

    edges << edge.new(line[0].to_i - 1, line[1].to_i - 1, line[2].to_i)
  end
  edges.sort_by! { |p| p.e }
  weight = 0
  edges.each do |e|
    if !(find(un, e.u) == find(un, e.v))
      weight += e.e
      union un, e.u, e.v
    end
  end
  puts weight
}
