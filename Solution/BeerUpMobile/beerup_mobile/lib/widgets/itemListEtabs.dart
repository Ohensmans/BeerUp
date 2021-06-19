import 'package:beerup_mobile/models/EtabModel.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ItemListEtabs extends StatefulWidget {
  const ItemListEtabs({Key key, this.etabPicture, this.etab, this.noPictureUrl})
      : super(key: key);

  final Etablissement etab;
  final String noPictureUrl;
  final String etabPicture;

  @override
  _ItemListEtabsState createState() => _ItemListEtabsState();
}

class _ItemListEtabsState extends State<ItemListEtabs> {
  @override
  Widget build(BuildContext context) {
    String orgIdEmpty = Uuid.NAMESPACE_NIL.toString();

    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          SizedBox(
            height: widget.etab.orgId != orgIdEmpty ? 80 : 45,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: widget.etab.orgId != orgIdEmpty
                      ? Container(
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(widget.etab.etaPhoto !=
                                          null &&
                                      widget.etab.etaPhoto.isNotEmpty
                                  ? widget.etabPicture + widget.etab.etaPhoto
                                  : widget.noPictureUrl),
                            ),
                          ),
                        )
                      : Container(),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          widget.etab.etaNom,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      widget.etab.etaNum != null && widget.etab.etaRue != null
                          ? Expanded(
                              flex: 1,
                              child: Text(
                                widget.etab.etaNum + ', ' + widget.etab.etaRue,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                                overflow: TextOverflow.clip,
                              ),
                            )
                          : Container(),
                      widget.etab.etaCp != null &&
                              widget.etab.etaVille != null &&
                              widget.etab.etaPays != null
                          ? Expanded(
                              flex: 1,
                              child: Text(
                                widget.etab.etaCp +
                                    ", " +
                                    widget.etab.etaVille +
                                    " - " +
                                    widget.etab.etaPays,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                                overflow: TextOverflow.clip,
                              ),
                            )
                          : Container(),
                      widget.etab.nomTypeEta != null
                          ? Expanded(
                              flex: 1,
                              child: Text(
                                'Type : ' + widget.etab.nomTypeEta,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                ),
                                overflow: TextOverflow.clip,
                              ),
                            )
                          : Container(),
                      widget.etab.distance != null && widget.etab.distance != 0
                          ? Expanded(
                              flex: 1,
                              child: Text(
                                'Distance: ' +
                                    widget.etab.distance
                                        .toStringAsPrecision(2) +
                                    ' km',
                                style: TextStyle(
                                  color: Colors.green[900],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                                overflow: TextOverflow.clip,
                              ),
                            )
                          : Container(),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  widget.etab.estOuvert
                                      ? Text(
                                          'Ouvert',
                                          style: TextStyle(
                                            color: Colors.green[900],
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                          overflow: TextOverflow.clip,
                                        )
                                      : Text(
                                          'Fermé',
                                          style: TextStyle(
                                            color: Colors.red[900],
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                          overflow: TextOverflow.clip,
                                        ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.grading_sharp),
                                    tooltip: 'Fiche étab',
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/loadEtab',
                                          arguments: {'etab': widget.etab});
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.map),
                                    tooltip: 'Où trouver',
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, '/loadOuTrouver',
                                          arguments: {'etab': widget.etab});
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
