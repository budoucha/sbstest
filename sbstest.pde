PGraphics left, right;
int eyeDistance = 100;
int w = 1920;
int h = 1080;

void setup() {
    size(3840,1080,P2D);
    left = createGraphics(1920, 1080, P3D);
    right = createGraphics(1920, 1080, P3D);
}

void draw() {
    //左側の描画
    left.beginDraw();
    left.camera(
        eyeDistance, 0, 500
        , 0, 0, 0,
        0, 1, 0);
    drawScene(left);
    left.endDraw();
    
    //右側の描画
    right.beginDraw();
    right.camera(
        - eyeDistance, 0, 500
        , 0, 0, 0,
        0, 1, 0);
    drawScene(right);
    right.endDraw();
    
    //メイン画面に描画
    image(left, 0, 0);
    image(right, w, 0);
}

void drawScene(PGraphics pg) {
    pg.background(0);
    
    pg.strokeWeight(2);
    
    pg.pushMatrix();
    pg.stroke(64,255,128);
    pg.fill(64,255,128,32);
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