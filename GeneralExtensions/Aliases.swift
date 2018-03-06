import Foundation

public typealias Name = (
    namePrefix: String?,
    //The portion of a name’s full form of address that precedes the name itself (for example, “Dr.,” “Mr.,” “Ms.”).
    givenName: String?,
    //Name bestowed upon an individual to differentiate them from other members of a group that share a family name (for example, “Johnathan”).
    middleName: String?,
    //Secondary name bestowed upon an individual to differentiate them from others that have the same given name (for example, “Maple”).
    familyName: String?,
    //Name bestowed upon an individual to denote membership in a group or family. (for example, “Appleseed”).
    nameSuffix: String?,
    //The portion of a name’s full form of address that follows the name itself (for example, “Esq.,” “Jr.,” “Ph.D.”).
    nickname: String?,
    //Name substituted for the purposes of familiarity (for example, "Johnny").
    phoneticRepresentation: String?
    //The phonetic representation name components of the receiver.
)


