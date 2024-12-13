/**
 * Main.cpp
 *
 * A simple Raylib example
 */

#include "raylib.h"
#include <cstdlib>

int main(int argc, const char **argv) {
	// Initialisation
	const int screenWidth = 1280;
	const int screenHeight = 820;
	const char *windowTitle = "Hello World!";
	const char *message = "Hello World! It's great to be here.";
	const int fontSize = 40;
	const float msgSpacing = 10.f;

	SetConfigFlags(FLAG_VSYNC_HINT);
	InitWindow(screenWidth, screenHeight, windowTitle);

	const Font font = GetFontDefault();
	const Vector2 msgSize = MeasureTextEx(font, message, fontSize, msgSpacing);
	const Vector2 msgPos = Vector2{(screenWidth - msgSize.x) / 2, (screenHeight - msgSize.y) / 2};

	SetTargetFPS(60);

	while (!WindowShouldClose()) {
		BeginDrawing();
			ClearBackground(RAYWHITE);
			DrawTextEx(font, message, msgPos, fontSize, msgSpacing, RED);
		EndDrawing();
	}

	CloseWindow();

	return EXIT_SUCCESS;
}
