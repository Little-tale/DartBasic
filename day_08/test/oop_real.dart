abstract class AbstractRectangular {
  double get height;
  double get width;
}

class Rectangular extends AbstractRectangular {
  @override
  double height;

  @override
  double width;

  Rectangular(this.width, this.height);
}

class Square extends AbstractRectangular {
  double side;

  Square(this.side);

  @override
  double get height => side;

  @override
  double get width => side;
}

void main() {
  final abt = getRectangular();

  switch (abt) {
    case Rectangular():
      abt.height = 50;
    case Square():
      abt.side = 40;
  }
}

AbstractRectangular getRectangular() {
  return Square(10);
}
