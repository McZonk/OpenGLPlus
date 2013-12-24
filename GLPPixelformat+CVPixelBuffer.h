#pragma once

#include "GLPPixelformat.h"

#include <CoreVideo/CoreVideo.h>

GLPPixelformat glpPixelformatFromCVPixelBuffer(CVPixelBufferRef pixelBuffer, size_t plane);
