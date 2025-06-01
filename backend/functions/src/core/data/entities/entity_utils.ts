/* eslint no-useless-escape: 0 */

/**
 * Remove null and undefined properties from an object
 * and remove the id property as firebase stores it as a key
 * @param entity
 * @returns
 */
export const cleanEntityId = <T>(entity: T): T => {
  const cleanedData = cleanData(entity);
  if (cleanedData.id) {
    delete cleanedData["id"];
  }
  return cleanedData;
};

/**
 * Remove null and undefined properties from an object
 * @param res
 * @return  a copy of the object without null and undefined properties
 */
export const cleanData = (res: any): any => {
  const resCopy = {...res};
  const propNames = Object.getOwnPropertyNames(resCopy);
  for (let i = 0; i < propNames.length; i++) {
    const propName = propNames[i];
    if (res[propName] === null || res[propName] === undefined) {
      delete resCopy[propName];
    }
  }
  return resCopy;
};

export function hashCode(str: string): number {
  let h = 0;
  for (let i = 0; i < str.length; i++) {
    h = 31 * h + str.charCodeAt(i);
  }
  return h & 0xFFFFFFFF;
}

export const cleanStringForCompare = (str: string): string => {
  let result = str;
  result = result.toLowerCase();
  result = result.replace(/[àáâãäå]/g, "a");
  result = result.replace(/[èéêë]/g, "e");
  result = result.replace(/[ìíîï]/g, "i");
  result = result.replace(/[òóôõö]/g, "o");
  result = result.replace(/[ùúûü]/g, "u");
  result = result.replace(/[ýÿ]/g, "y");
  result = result.replace(/[ñ]/g, "n");
  result = result.replace(/[ç]/g, "c");
  result = result.replace(/[ß]/g, "ss");
  result = result.replace(/[œ]/g, "oe");
  result = result.replace(/[æ]/g, "ae");
  result = result.replace(/[\-_]/g, " ");
  result = result.replace(/(\s){2,}/g, " ");
  result = result.trim();
  return result;
};

export const escapeSpecialChars = (str: string): string => {
  let result = str;
  result = result.replace(/[\?]/g, "\\?");
  result = result.replace(/[\!]/g, "\\!");
  result = result.replace(/[\&]/g, "\\&");
  result = result.replace(/[\()]/g, "\\(");
  result = result.replace(/[\))]/g, "\\)");
  result = result.replace(/[\[]/g, "\\[");
  result = result.replace(/[\]]/g, "\\]");
  result = result.replace(/[\{]/g, "\\{");
  result = result.replace(/[\}]/g, "\\}");
  result = result.replace(/[\/]/g, "\\/");
  result = result.replace(/[\+]/g, "\\+");
  result = result.replace(/[\*]/g, "\\*");
  result = result.replace(/[\^]/g, "\\^");
  result = result.replace(/[\$]/g, "\\$");
  result = result.replace(/[\|]/g, "\\|");
  result = result.replace(/[\=]/g, "\\=");
  result = result.replace(/[\,]/g, "\\,");
  result = result.replace(/[\:]/g, "\\:");
  result = result.replace(/[\~]/g, "\\~");
  result = result.replace(/[\"]/g, "\\\"");
  result = result.replace(/[\.]/g, "\\.");
  result = result.replace(/[\']/g, "\\'");
  return result;
};
