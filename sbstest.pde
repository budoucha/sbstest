PGraphics left, right;
int eyeDistance = 100;
int w = 1920;
int h = 1080;

void setup() {
    fullScreen(P2D);
    left = createGraphics(1920, 1080, P3D);
    right = createGraphics(1920, 1080, P3D);
    background(0);
}

void draw() {
    left.beginDraw();
    left.camera(
        - eyeDistance, 0, 500
        , 0, 0, 0,
        0, 1, 0);
    drawScene(left);
    left.endDraw();
    
    right.beginDraw();
    right.camera(
        eyeDistance, 0, 500
        , 0, 0, 0,
        0, 1, 0);
    drawScene(right);
    right.endDraw();
    
    image(left, 0, 0);
    image(right, w, 0);
}

void drawScene(PGraphics pg) {
    pg.background(0);
    
    pg.strokeWeight(2);
    
    pg.stroke(64,255,128);
    pg.fill(64,255,128,32);
    pg.pushMatrix();
    pg.rotateY(radians(frameCount));
    pg.box(250);
    pg.popMatrix();

    pg.stroke(255,128,64);
    pg.fill(255,128,64,32);
    pg.rotateX(radians(45));
    pg.rotateY(radians(45));
    pg.rotateY( -radians(frameCount));
    pg.box(300);
}