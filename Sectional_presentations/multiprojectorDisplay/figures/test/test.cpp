#include<opencv/highgui.h>

int main()
{
    IplImage *test = cvLoadImage("../mod_all_bboxes.jpg");

    cvLine(test, cvPoint(108,88), cvPoint(3548,84), cvScalar(0,0,255), 10);
    cvLine(test, cvPoint(108,88), cvPoint(109,2635), cvScalar(0,0,255), 10);
    cvLine(test, cvPoint(109,2635), cvPoint(3550,2634), cvScalar(0,0,255), 10);
    cvLine(test, cvPoint(3548,84), cvPoint(3550,2634), cvScalar(0,0,255), 10);

    cvSaveImage("test.jpg", test);
    return 0;
}
