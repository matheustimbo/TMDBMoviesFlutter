import 'package:flutter/material.dart';
import 'package:tmdbmovies/app/modules/home/components/tvshow_widget.dart';
import 'package:tmdbmovies/shared/models/tvshow_model.dart';

class TvshowsListSection extends StatefulWidget {
  const TvshowsListSection(
      {Key? key,
      required this.sectionTitle,
      required this.tvshows,
      required this.onEndReached,
      required this.loading})
      : super(key: key);

  final String sectionTitle;
  final List<Tvshow> tvshows;
  final Function onEndReached;
  final bool loading;

  @override
  _TvshowsListSectionState createState() => _TvshowsListSectionState();
}

class _TvshowsListSectionState extends State<TvshowsListSection> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          !widget.loading) {
        widget.onEndReached();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                Text(
                  widget.sectionTitle,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                if (widget.loading)
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
              ],
            ),
          ),
          Container(
            height: 300,
            child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.only(left: 8),
                itemCount: widget.tvshows.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    TvshowWidget(tvshow: widget.tvshows[index])),
          )
        ],
      ),
    );
  }
}
