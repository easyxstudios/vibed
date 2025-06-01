export function delay(time: number) {
  return new Promise(function(_) {
    setTimeout(_, time);
  });
}
