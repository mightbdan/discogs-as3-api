package newcommerce.discogs 
{
	import flash.display.MovieClip;
	import newcommerce.discogs.data.DCArtistData;
	import newcommerce.discogs.data.DCImageData;	
	import newcommerce.discogs.data.DCReleaseSummary;
	import newcommerce.discogs.feeds.DCImageFeed;
	import newcommerce.discogs.feeds.DCReleaseFeed;
	
	/**
	 * ...
	 * @author Martin Legris ( http://blog.martinlegris.com )
	 */
	public class DiscogsTest extends MovieClip
	{
		protected var _discogs:DiscogsClient;
		
		public function DiscogsTest() 
		{
			_discogs = DiscogsClient.getInstance();
			_discogs.addEventListener(DiscogsReleaseEvent.RELEASES_RECEIVED, doReleases);
			_discogs.getReleases("Air");
		}
		
		protected function doReleases(evt:DiscogsReleaseEvent):void
		{
			var artist:DCArtistData = evt.artist;
			traceArtist(artist);
		}		
		
		protected function traceArtist(artist:DCArtistData):void
		{
			trace("\n");
			trace("artist.name: "+artist.name);
			trace("artist.members: "+artist.members);
			trace("artist.urls: " + artist.urls);
			traceImages(artist.images);
			traceReleases(artist.releases);
		}
		
		protected function traceImages(images:DCImageFeed):void
		{
			trace("\ncontains " + images.count + " images");
			var image:DCImageData;
			while (image = images.next())
				traceImage(image);
		}
		
		protected function traceImage(image:DCImageData):void
		{
			trace("\n");
			trace("image.type: " + image.type);
			trace("image.url: " + image.url);
			trace("image.width: " + image.width);
			trace("image.height: " + image.height);
			trace("image.tnUrl: " + image.tnUrl);
		}
		
		protected function traceReleases(releases:DCReleaseFeed):void
		{
			var release:DCReleaseSummary;
			trace("\ncontains " + releases.count + " releases");
			while (release = releases.next())
				traceReleaseSummary(release);
		}
		
		protected function traceReleaseSummary(release:DCReleaseSummary):void
		{
			trace("\n");
			trace("release.id: " + release.id);
			trace("release.title: " + release.title);
			trace("release.format: " + release.format);
			trace("release.year: " + release.year);
			trace("release.label: " + release.label);
			trace("release.status: " + release.status);
			trace("release.type: " + release.type);
		}
	}
}