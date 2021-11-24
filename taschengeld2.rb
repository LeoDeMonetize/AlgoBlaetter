testcases = gets.to_i
if testcases == 0
  raise 'Number = 0 or no number'
end


(1..testcases).each { ||
  min_results = []
  max_results = []
  line = gets
  if line == nil
    raise "No String typed in"
  end
  line= line.chars
  numbers = []

  signs = []

  line.each_with_index { |k, i|
    if i % 2 == 0;
      numbers << k.to_i
    else
      signs << k
    end }
  n = numbers.length

  (1..n * n).each { ||
    max_results << 0
    min_results << 2 ** 16
  }

  (0..n - 1).each { |x|
    max_results[x] = numbers[x]
    min_results[x] = numbers[x]
  }

  (1..n - 1).each { |j|
    (0..n - 1 - j).each { |i|
      (0..j - 1).each { |k|

        sign_index = i + k
        if signs[sign_index] == '+'
          max = [max_results[j * n + i], max_results[k * n + i] + max_results[(j - 1 - k) * n + i + k + 1]].max
          max_results[j * n + i] = max
          min = [min_results[j * n + i], min_results[k * n + i] + min_results[(j - 1 - k) * n + i + k + 1]].min
          min_results[j * n + i] = min
        else
          m = [max_results[j * n + i], max_results[k * n + i] * max_results[(j - 1 - k) * n + i + k + 1]].max
          max_results[j * n + i] = m
          minn = [min_results[j * n + i], min_results[k * n + i] * max_results[(j - 1 - k) * n + i + k + 1]].min
          min_results[j * n + i] = minn
        end
      }
    }
  }
  puts "#{max_results[n * n - n]} #{min_results[n * n - n].to_s}"

}

