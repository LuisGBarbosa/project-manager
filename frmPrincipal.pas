unit frmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.Menus, Vcl.StdCtrls, Vcl.ComCtrls, System.ImageList, Vcl.ImgList,
  Vcl.Imaging.jpeg;

type
  TformPrincipal = class(TForm)
    Panel1: TPanel;
    btnProjetos: TButton;
    MainMenu1: TMainMenu;
    Menu1: TMenuItem;
    Consultas1: TMenuItem;
    StatusBar1: TStatusBar;
    ImageList1: TImageList;
    Button4: TButton;
    Button1: TButton;
    Image1: TImage;
    Button3: TButton;
    Button5: TButton;
    procedure btnProjetosClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formPrincipal: TformPrincipal;

implementation

uses
  frmProjetos, frmMembros, FormOutros;

{$R *.dfm}

procedure TformPrincipal.btnProjetosClick(Sender: TObject);
begin
  frmConsultaProjeto.Show;
end;

procedure TformPrincipal.Button1Click(Sender: TObject);
begin
  uFormOutros.Show;
end;

procedure TformPrincipal.Button4Click(Sender: TObject);
begin
  frmConsultaMembros.Show;
end;

end.
