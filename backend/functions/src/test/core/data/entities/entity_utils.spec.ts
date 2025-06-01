import {cleanData, cleanEntityId, cleanStringForCompare} from "../../../../core/data/entities/entity_utils";


describe("cleanStringForCompare", () => {
  it("should remove all multiple spaces, accents and -,_", () => {
    expect(cleanStringForCompare("LANFEUST DES ÉTOILES")).toBe("lanfeust des etoiles");
    expect(cleanStringForCompare("Lanfeust des étoiles")).toBe("lanfeust des etoiles");
    expect(cleanStringForCompare("ùnià as THE fear-of-ça")).toBe("unia as the fear of ca");
  });
});

describe("cleanData", () => {
  it("should remove object null or undefined properties", () => {
    const input = {a: null, b: undefined, c: "c"};
    const output = cleanData(input);
    expect(output).toEqual({c: "c"});
  });

  it("should not change input", () => {
    const input = {a: null, b: undefined, c: "c"};
    const output = cleanData(input);
    expect(output).not.toEqual(input);
  });
});

describe("cleanEntityId", () => {
  it("should remove object null or undefined properties", () => {
    const input = {a: null, b: undefined, c: "c"};
    const output = cleanEntityId(input);
    expect(output).toEqual({c: "c"});
  });

  it("should remove object id", () => {
    const input = {id: "dsqdd", b: undefined, c: "c"};
    const output = cleanEntityId(input);
    expect(output).toEqual({c: "c"});
  });

  it("should not change input", () => {
    const input = {a: null, b: undefined, c: "c"};
    const output = cleanEntityId(input);
    expect(output).not.toEqual(input);
  });
});
