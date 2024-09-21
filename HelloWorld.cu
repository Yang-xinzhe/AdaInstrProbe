#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

__global__ void print_from_gpu(void) {
    printf("Hello World! from thread [%d, %d] from device\n", threadIdx.x, blockIdx.x);
}

int main(int argc, char const *argv[])
{
    printf("Hello world from Host\n");
    while(1){
        print_from_gpu<<<1,1>>>();
        sleep(1);
    }
    

    cudaDeviceSynchronize();
    return 0;
}

