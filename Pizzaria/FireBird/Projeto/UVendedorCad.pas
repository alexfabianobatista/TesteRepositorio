unit UVendedorCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadrao, ImgList, IBCustomDataSet, IBUpdateSQL, IBDatabase, DB,
  IBQuery, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls, ToolWin,
  Mask, DBCtrls;

type
  TFVendedorCad = class(TFPadrao)
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEFoco: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    MeDataAdmissao: TMaskEdit;
    Label7: TLabel;
    TBCODVENDEDOR: TIntegerField;
    TBNOME: TIBStringField;
    TBCOMISSAO: TFloatField;
    TBDATA_ADMISSAO: TDateTimeField;
    procedure FormCreate(Sender: TObject);
    procedure TGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TEditarClick(Sender: TObject);
    procedure TIncluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVendedorCad: TFVendedorCad;

implementation

uses UDmVendedor, UFuncoes;

{$R *.dfm}

procedure TFVendedorCad.FormCreate(Sender: TObject);
begin
  inherited;
  CampoRetorno := 'CODVENDEDOR';
end;

procedure TFVendedorCad.TGravarClick(Sender: TObject);
begin
  if TBNOME.Value = '' then
  Begin
    MessageDlg('Informe o Nome.', mtWarning, [mbOK], 0);
    DBEFoco.SetFocus;
    Exit;
  End;

  if TBCOMISSAO.IsNull then
    TBCOMISSAO.Value := 0;

  if (MeDataAdmissao.Text = '  /  /    ') then
    TBDATA_ADMISSAO.Value := Date
  else
  Begin
    if (not DataValida(MeDataAdmissao.Text)) then
    Begin
      MessageDlg('Data de Admissão inválida.', mtWarning, [mbOK], 0);
      MeDataAdmissao.SetFocus;
      Exit;
    End;
    TBDATA_ADMISSAO.Text := MeDataAdmissao.Text;
  end;

  inherited;

end;

procedure TFVendedorCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if DmVendedor.QSelVendedor.Active then
  Begin
    DmVendedor.QSelVendedor.Close;
    DmVendedor.QSelVendedor.Open;
  End;
end;

procedure TFVendedorCad.TEditarClick(Sender: TObject);
begin
  inherited;
  if TBDATA_ADMISSAO.Value = 0 then
    MeDataAdmissao.Clear
  else
    MeDataAdmissao.Text := FormatDateTime('dd/MM/yyyy', TBDATA_ADMISSAO.Value);
end;

procedure TFVendedorCad.TIncluirClick(Sender: TObject);
begin
  inherited;
  MeDataAdmissao.Clear;
end;

end.
