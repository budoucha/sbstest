PGraphics left, right;
int eyeDistance = 50;
int w = 1920;
int h = 1080;
float aspectRatio = float(w)/h;
float fovy = 2*atan(tan(radians(46)/2)/aspectRatio);

void setup() {
    fullScreen(P2D);
    left = createGraphics(1920, 1080, P3D);
    right = createGraphics(1920, 1080, P3D);
    background(0);
}

void draw() {
    left.beginDraw();
    left.camera(
        - eyeDistance, 0, 1000,
        0, 0, 0,
        0, 1, 0);
    drawScene(left);
    left.endDraw();
    
    right.beginDraw();
    right.camera(
        eyeDistance, 0, 1000,
        0, 0, 0,
        0, 1, 0);
    drawScene(right);
    right.endDraw();
    
    image(left, 0, 0);
    image(right, w, 0);
}

void drawScene(PGraphics pg) {
    pg.background(0);
    pg.strokeWeight(8);

    pg.perspective(fovy, aspectRatio, 400, 1600);

    //Central Emerald
    pg.stroke(63, 255, 127);
    pg.fill(63, 255, 127, 32);
    pg.pushMatrix();
    pg.rotateY(radians(frameCount));
    pg.rotateZ(radians(frameCount));
    pg.box(100);
    pg.popMatrix();
    
    //Central Orange
    pg.stroke(255, 127, 63);
    pg.fill(255, 127, 63, 32);
    pg.pushMatrix();
    pg.rotateX(radians(45));
    pg.rotateY(radians(45));
    pg.rotateY( -radians(frameCount));
    pg.box(120);
    pg.popMatrix();
    
    //Satelite Violet
    pg.stroke(127, 63, 255);
    pg.fill(127, 63, 255, 32);
    pg.pushMatrix();
    pg.rotateY(radians(frameCount / 2.0));
    pg.translate(200, 0, 0);
    pg.rotateX(radians(frameCount / 2.0));
    pg.rotateZ(radians(45));
    pg.box(45);
    pg.popMatrix();
    
    //Satelite Azure
    pg.stroke(63, 127, 255);
    pg.fill(63, 127, 255, 32);
    pg.pushMatrix();
    pg.rotateY(radians(180));
    pg.rotateY(radians(frameCount / 3.0));
    pg.translate(320, 0, 0);
    pg.rotateX(radians(45));
    pg.rotateZ(radians(45));
    pg.box(80);
    pg.popMatrix();
    
    //Satelite Pink
    pg.stroke(255, 63, 127);
    pg.fill(255, 63, 127, 32);
    pg.pushMatrix();
    pg.rotateY(radians(90));
    pg.rotateX(radians( -12.5));
    pg.rotateY(radians(frameCount * 1.5));
    pg.translate(120, 0, 0);
    pg.rotateZ(radians(45));
    pg.rotateY(radians(frameCount * 2));
    pg.box(30);
    pg.popMatrix();
    
    //Satelite Lime
    pg.stroke(127, 255, 63);
    pg.fill(127, 255, 63, 32);
    pg.pushMatrix();
    pg.rotateY(radians(45));
    pg.rotateX(radians(28));
    pg.rotateY(radians(frameCount * 1.8));
    pg.translate(110, 0, 0);
    pg.rotateZ(radians(45));
    pg.rotateY(radians(frameCount * 2));
    pg.box(25);
    pg.popMatrix();
}
