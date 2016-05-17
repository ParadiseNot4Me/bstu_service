
require 'matrix'

class Matrix
  def []=(i, j, x)
    @rows[i][j] = x
  end
end

source = Matrix[[1,3,5,7,12],[3,5,7,1,0],[5,7,1,3,4],[7,1,3,5,16]]

if (source.column_size() -1 != source.row_size())
  puts "Matrix is not valid"
end

main = Matrix.zero(source.row_size())

n = source.row_size() - 1

for i in 0..n
  for j in 0..n
    main[i,j] = source[i,j]
  end
end

main_determinant = main.determinant
if (main_determinant == 0)
  puts "Matrix has no solutions"
end

for d in 0..n 
  extr = Matrix.zero(source.row_size())
  for i in 0..n 
    for j in 0..n 
      if(j == d)
        extr[i,j] = source[i,n + 1]
      else
        extr[i,j] = source[i, j]
      end
    end
  end
  
  puts "x" + d.to_s + " " + (extr.determinant / main.determinant).to_s
end
