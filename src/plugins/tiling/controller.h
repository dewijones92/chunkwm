#ifndef PLUGIN_CONTROLLER_H
#define PLUGIN_CONTROLLER_H

void FocusWindow(char *Direction);
void SwapWindow(char *Direction);
void MoveWindow(char *Direction);
void ToggleWindow(char *Type);
void UseInsertionPoint(char *Direction);

void RotateWindowTree(char *Degrees);

struct macos_window;
void FloatWindow(macos_window *Window);
void UnfloatWindow(macos_window *Window);

#endif
