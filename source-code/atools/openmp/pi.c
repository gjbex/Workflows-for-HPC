#include <omp.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    long nr_points = 10000;
    if (argc > 1) {
        nr_points = atol(argv[1]);
    }
    double pi = 0.0;
    double dx = 1.0/nr_points;
#pragma omp parallel for default(none) shared(dx, nr_points) reduction(+:pi)
        for (int i = 0; i < nr_points; i++) {
            double x = i*dx;
            pi += 1.0/(1.0 + x*x);
        }
    pi *= 4.0*dx;
    printf("pi = %lf\n", pi);
    return 0;
}
