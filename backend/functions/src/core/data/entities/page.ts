export interface Page<T> {
    items: T[];
    lastSnapshot?: FirebaseFirestore.QueryDocumentSnapshot | undefined;
}
