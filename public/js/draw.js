var draw;
var preHandler = function(e){e.preventDefault();}

class Draw {
  constructor(el, width, height) {
    this.el = el
    this.width = width;
    this.height = height;
    this.canvas = document.getElementById(this.el);

    this.canvas.setAttribute('width', this.width);
    this.canvas.setAttribute('height', this.height);

    this.markCanvas = document.createElement('canvas');
    this.markCanvas.setAttribute('width', 130);
    this.markCanvas.setAttribute('height', 80);
    this.markCanvas.style.display = 'none';

    this.isStart = false;

    document.getElementsByTagName('body')[0].appendChild(this.markCanvas);

    var mctx = this.markCanvas.getContext('2d');

    mctx.font = '20px 黑体';  
    mctx.rotate(-20 * Math.PI / 180);
    mctx.fillStyle = 'rgba(100, 100, 100, 0.1)';
    // mctx.fillText('众星软件', -10, 60);
    mctx.rotate(20 * Math.PI / 180);

    this.cxt = this.canvas.getContext('2d');

    this.stage_info = this.canvas.getBoundingClientRect();

    // console.log('stage_info', this.stage_info);
    this.path = {
      beginX: 0,
      beginY: 0,
      endX: 0,
      endY: 0
    }
  }

  renderMark() {

    // this.cxt.fillStyle = this.cxt.createPattern(this.markCanvas, 'repeat');
    // this.cxt.rect(0, 0, this.width, this.height);
    // this.cxt.fillStyle = '#d9d9d9';
    // this.cxt.fill();
  }

  init(btn) {
    var that = this;

    this.canvas.addEventListener('touchstart', function(event) {
      document.addEventListener('touchstart', preHandler, false);
      that.drawBegin(event)
    })
    this.canvas.addEventListener('touchend', function(event) {
      document.addEventListener('touchend', preHandler, false);
      that.drawEnd();
    });
    this.clear(btn);
  }

  drawBegin(e) {
    var that = this;
    window.getSelection() ? window.getSelection().removeAllRanges() : document.selection.empty();
    this.stage_info = this.canvas.getBoundingClientRect();
    this.cxt.strokeStyle = "#000";
    this.cxt.lineWidth = 3;
    this.cxt.beginPath();
    this.cxt.moveTo(
      e.changedTouches[0].clientX - this.stage_info.left,
      e.changedTouches[0].clientY - this.stage_info.top
    );
    this.path.beginX = e.changedTouches[0].clientX - this.stage_info.left;
    this.path.beginY = e.changedTouches[0].clientY - this.stage_info.top;

    // console.log('start', e.changedTouches, e.changedTouches[0].clientX, e.changedTouches[0].clientY);
    // console.log(this.path.beginX, e.changedTouches[0].clientX, this.stage_info.left);
    // console.log(this.path.beginY, e.changedTouches[0].clientY, this.stage_info.top);
    this.canvas.addEventListener("touchmove", function(event) {
      event.preventDefault();
      that.drawing(event)
    });

    this.isStart = true;
  }

  drawing(e) {
    this.stage_info = this.canvas.getBoundingClientRect();
    this.cxt.lineTo(
      e.changedTouches[0].clientX - this.stage_info.left,
      e.changedTouches[0].clientY - this.stage_info.top
    )
    this.path.endX = e.changedTouches[0].clientX - this.stage_info.left
    this.path.endY = e.changedTouches[0].clientY - this.stage_info.top
    // console.log('drawing', e.changedTouches, e.changedTouches[0].clientX, e.changedTouches[0].clientY);
    this.cxt.stroke()
  }

  drawEnd() {
    document.removeEventListener('touchstart', preHandler, false);
    document.removeEventListener('touchend', preHandler, false);
    document.removeEventListener('touchmove', preHandler, false);
    //canvas.ontouchmove = canvas.ontouchend = null
  }

  clear(btn) {
    this.cxt.beginPath();
    this.cxt.clearRect(0, 0, this.width, this.height);
    this.renderMark();
    this.isStart = false;
  }
  
  save() {
    return this.canvas.toDataURL("image/png");
  }
}