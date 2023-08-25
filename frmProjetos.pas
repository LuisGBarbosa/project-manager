unit frmProjetos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.WinXPanels, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Datasnap.Provider, Datasnap.DBClient, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, dmConexao, Vcl.ComCtrls, frmMembros;

type
  TfrmConsultaProjeto = class(TForm)
    Panel1: TPanel;
    btnPesquisar: TButton;
    Edit1: TEdit;
    cbSitua��o: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    pnlPrincipal: TCardPanel;
    cardConsultaProjetos: TCard;
    Panel2: TPanel;
    btnAdicionar: TButton;
    btnEditar: TButton;
    btnApagar: TButton;
    btnDetalhes: TButton;
    dbgConsultaProjetos: TDBGrid;
    DadosProjeto: TCard;
    edtNomeProjeto: TEdit;
    edtResponsavel: TEdit;
    cbSituacao: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btnCancelar: TButton;
    btnSalvar: TButton;
    mmDescricao: TMemo;
    lblObservacao: TLabel;
    sqlProjetos: TFDQuery;
    cdsProjetos: TClientDataSet;
    dspProjetos: TDataSetProvider;
    dsConsultaProjetos: TDataSource;
    cdsProjetosid: TAutoIncField;
    cdsProjetosnomeprojeto: TStringField;
    cdsProjetosdescricao: TStringField;
    cdsProjetosresponsavel: TStringField;
    cdsProjetossituacao: TStringField;
    cdsProjetosprevisao: TDateField;
    dtPrevisao: TDateTimePicker;
    Label6: TLabel;
    procedure btnDetalhesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Pesquisar;
    procedure desabilitaCampos;
    procedure limparCampos;
    procedure habilitaCampos;
  public
    { Public declarations }
    procedure carregaValores;
  end;

var
  frmConsultaProjeto: TfrmConsultaProjeto;

implementation

{$R *.dfm}

procedure TfrmConsultaProjeto.btnPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmConsultaProjeto.btnApagarClick(Sender: TObject);
begin
  cdsProjetos.Delete;
  cdsProjetos.ApplyUpdates(0);
  Application.MessageBox('Projeto apagado com sucesso!', 'Informa��o!', MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmConsultaProjeto.btnCancelarClick(Sender: TObject);
begin
  cdsProjetos.Cancel;
  pnlPrincipal.ActiveCard := cardConsultaProjetos;
end;

procedure TfrmConsultaProjeto.btnSalvarClick(Sender: TObject);
begin
  cdsProjetosnomeprojeto.AsString := Trim(edtNomeProjeto.Text);
  cdsProjetosresponsavel.AsString := Trim(edtResponsavel.Text);
  cdsProjetossituacao.AsString := Trim(cbSituacao.Text);
  cdsProjetosprevisao.AsDateTime := dtPrevisao.Date;
  cdsProjetosdescricao.AsString := Trim(mmDescricao.Text);

  cdsProjetos.Post;
  cdsProjetos.ApplyUpdates(0);

  Application.MessageBox('Projeto cadastrado com sucesso', 'Sucesso!', MB_OK + MB_ICONINFORMATION);
  pnlPrincipal.ActiveCard := cardConsultaProjetos;
end;

procedure TfrmConsultaProjeto.carregaValores;
begin
  edtNomeProjeto.Text := cdsProjetosnomeprojeto.AsString;
  edtResponsavel.Text := cdsProjetosresponsavel.AsString;
  cbSituacao.Text := cdsProjetossituacao.AsString;
  dtPrevisao.Date := cdsProjetosprevisao.AsDateTime;
  mmDescricao.Text := cdsProjetosdescricao.AsString;
end;

procedure TfrmConsultaProjeto.desabilitaCampos;
begin
  edtNomeProjeto.Enabled := False;
  edtResponsavel.Enabled := False;
  cbSituacao.Enabled := False;
  dtPrevisao.Enabled := False;
  mmDescricao.Enabled := False;
end;

procedure TfrmConsultaProjeto.btnAdicionarClick(Sender: TObject);
begin
  limparCampos;
  pnlPrincipal.ActiveCard := DadosProjeto;
  cdsProjetos.Insert;
  cdsProjetos.ClearFields;
end;

procedure TfrmConsultaProjeto.btnDetalhesClick(Sender: TObject);
begin
  pnlPrincipal.ActiveCard := DadosProjeto;
  carregaValores;
  desabilitaCampos;
end;

procedure TfrmConsultaProjeto.btnEditarClick(Sender: TObject);
begin
  pnlPrincipal.ActiveCard := DadosProjeto;
  cdsProjetos.Edit;
  habilitaCampos;
  carregaValores;
end;

procedure TfrmConsultaProjeto.FormShow(Sender: TObject);
begin
  Pesquisar;
  pnlPrincipal.ActiveCard := cardConsultaProjetos;
end;

procedure TfrmConsultaProjeto.habilitaCampos;
begin
  edtNomeProjeto.Enabled := True;
  edtResponsavel.Enabled := True;
  cbSituacao.Enabled := True;
  dtPrevisao.Enabled := True;
  mmDescricao.Enabled := True;
end;

procedure TfrmConsultaProjeto.limparCampos;
begin
  edtNomeProjeto.Text := '';
  edtResponsavel.Text := '';
  cbSituacao.Text := '';
  dtPrevisao.Date := Now;
  mmDescricao.Text := '';
end;

procedure TfrmConsultaProjeto.Pesquisar;
begin
  //primeiro � preciso fechar o clientDataSet, setar o comando e depois abrir de novo.
  cdsProjetos.Close;
  cdsProjetos.CommandText := 'SELECT * FROM Projetos';
  cdsProjetos.Open;
end;

end.
