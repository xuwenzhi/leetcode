# rotate-image

[https://leetcode.com/problems/rotate-image/](https://leetcode.com/problems/rotate-image/)


# thinking

因为题目要求不能再创建2D空间，所以最好就只在给出的 **matrix** 进行操作，最开始是想通过

1. 转置
2. 翻转

的方式实现，所以得到了如下的答案，不过性能不算太高，才beats了3535% 的c submission所以还是要优化.

```c
void rotate(int** matrix, int matrixRowSize, int *matrixColSizes) {
    if (matrix == NULL) {
        return;
    }
    int i, j, temp= 0;
    for (; i < matrixRowSize; i++) {
        for (j = i+1; j < matrixRowSize; j ++) {
            temp = matrix[j][i];
            matrix[j][i] = matrix[i][j];
            matrix[i][j] = temp;
        }
    }

    for (i=0; i < matrixRowSize; i++) {
        for (j = 0; j < matrixRowSize / 2; j ++) {
            temp = matrix[i][j];
            matrix[i][j] = matrix[i][matrixRowSize-j-1];
            matrix[i][matrixRowSize-j-1] = temp;
        }
    }
}
```

# profile thinking

![https://github.com/xuwenzhi/leetcode/raw/master/images/rotate-image1.jpg](https://github.com/xuwenzhi/leetcode/raw/master/images/rotate-image1.jpg)

如图，针对这个问题，可以把这个矩阵想象一层层的环，由外到内，逐个解决，当然实现上，其实也可以用递归实现，可能会更加好理解.

## 难点

1. 需要准确定位环的遍历次数

2. 需要找到矩阵四个边 点 的计算公式

```c
void rotate(int** matrix, int matrixRowSize, int *matrixColSizes) {
    int i,j,temp;
    for (i = 0; i < matrixRowSize / 2; i++) {
        for (j = i; j < matrixRowSize - i -1; j++ ) {
            temp = matrix[i][j];
            matrix[i][j] = matrix[matrixRowSize - j -1][i];
            matrix[matrixRowSize - j -1][i] = matrix[matrixRowSize-i-1][matrixRowSize-j-1];
            matrix[matrixRowSize-i-1][matrixRowSize-j-1] = matrix[j][matrixRowSize-i-1];
            matrix[j][matrixRowSize-i-1] = temp;
        }
    }
}
```
