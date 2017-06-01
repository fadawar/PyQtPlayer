import os
import sys

from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine

if __name__ == '__main__':
    app = QGuiApplication(sys.argv)

    engine = QQmlApplicationEngine(os.path.join(os.path.dirname(__file__), 'player.qml'))
    engine.quit.connect(app.quit)

    sys.exit(app.exec_())
