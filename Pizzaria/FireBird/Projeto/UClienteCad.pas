unit UClienteCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadrao, DB, IBCustomDataSet, ImgList, IBUpdateSQL, IBDatabase,
  IBQuery, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls, ToolWin,
  Mask, DBCtrls, dblookup;

type
  TFClienteCad = class(TFPadrao)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEFoco: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Label6: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    Label8: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DBEdit2: TDBEdit;
    Label9: TLabel;
    SpeedButton3: TSpeedButton;
    DBEdit7: TDBEdit;
    TBCODCLIENTE: TIntegerField;
    TBNOME: TIBStringField;
    TBCPF: TIBStringField;
    TBRG: TIBStringField;
    TBCODENDERECO: TIntegerField;
    TBCODBAIRRO: TIntegerField;
    TBCODCIDADE: TIntegerField;
    TBNUMERO: TIntegerField;
    TBdscendereco: TStringField;
    TBdscbairro: TStringField;
    TBdsccidade: TStringField;
    MeDataNasc: TMaskEdit;
    Label7: TLabel;
    MeCPF: TMaskEdit;
    MeRG: TMaskEdit;
    TBDATA_CADASTRO: TDateTimeField;
    TBDATA_NASCIMENTO: TDateTimeField;
    procedure FormShow(Sender: TObject);
    procedure TIncluirClick(Sender: TObject);
    procedure TEditarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure TBCalcFields(DataSet: TDataSet);
    procedure TGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FClienteCad: TFClienteCad;

implementation

uses UDmEndereco, UDmBairro, uDmCidade, UCidadeCad, UEnderecoCad, UFuncoes,
  UBairroCad, UDmSistema;

{$R *.dfm}

procedure TFClienteCad.FormShow(Sender: TObject);
begin
  inherited;
  DmEndereco.QSelEndereco.Close;
  DmEndereco.QSelEndereco.Open;
  DmBairro.QSelBairro.Close;
  DmBairro.QSelBairro.Open;
  DmCidade.QSelCidade.Close;
  DmCidade.QSelCidade.Open;
end;

procedure TFClienteCad.TIncluirClick(Sender: TObject);
begin
  inherited;
  MeDataNasc.Clear;
  MeCPF.Clear;
  MeRG.Clear;
end;

procedure TFClienteCad.TEditarClick(Sender: TObject);
begin
  inherited;
  if TBDATA_NASCIMENTO.Value = 0 then
    MeDataNasc.Clear
  else
    MeDataNasc.Text := FormatDateTime('dd/MM/yyyy', TBDATA_NASCIMENTO.Value);
  MeCPF.Text := TBCPF.Text;
  MeRG.Text := TBRG.Text;
end;

procedure TFClienteCad.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFEnderecoCad, FEnderecoCad);
  FEnderecoCad.Consultando := True;
  FEnderecoCad.ShowModal;

  if RetornoConsulta > -1 then
    TBCODENDERECO.Value := RetornoConsulta
  else
    TBCODENDERECO.Clear;
end;

procedure TFClienteCad.FormCreate(Sender: TObject);
begin
  inherited;
  CampoRetorno := 'CODCLIENTE';
end;

procedure TFClienteCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DmEndereco.QSelEndereco.Close;
  DmBairro.QSelBairro.Close;
  DmCidade.QSelCidade.Close;
end;

procedure TFClienteCad.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFBairroCad, FBairroCad);
  FBairroCad.Consultando := True;
  FBairroCad.ShowModal;

  if RetornoConsulta > -1 then
    TBCODBAIRRO.Value := RetornoConsulta
  else
    TBCODBAIRRO.Clear;
end;

procedure TFClienteCad.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFCidadeCad, FCidadeCad);
  FCidadeCad.Consultando := True;
  FCidadeCad.ShowModal;

  if RetornoConsulta > -1 then
    TBCODCIDADE.Value := RetornoConsulta
  else
    TBCODCIDADE.Clear;
end;

procedure TFClienteCad.TBCalcFields(DataSet: TDataSet);
begin
  inherited;
  TBdscendereco.Value := BuscaString('DSCENDERECO', 'TB_ENDERECO', 'CODENDERECO', TBCODENDERECO.Value);
  TBdscbairro.Value := BuscaString('DSCBAIRRO', 'TB_BAIRRO', 'CODBAIRRO', TBCODBAIRRO.Value);
  TBdsccidade.Value := BuscaString('DSCCIDADE', 'TB_CIDADE', 'CODCIDADE', TBCODCIDADE.Value);
end;

procedure TFClienteCad.TGravarClick(Sender: TObject);
begin
  if TBNOME.Value = '' then
  Begin
    MessageDlg('Informe o Nome.', mtWarning, [mbOK], 0);
    DBEFoco.SetFocus;
    Exit;
  End;

  if Trim(MeCPF.Text) = '' then
  Begin
    MessageDlg('Informe o CPF.', mtWarning, [mbOK], 0);
    MeCPF.SetFocus;
    Exit;
  End;
  TBCPF.Text := MeCPF.Text;

  if Trim(MeRG.Text) = '' then
  Begin
    MessageDlg('Informe o RG.', mtWarning, [mbOK], 0);
    MeRG.SetFocus;
    Exit;
  End;
  TBRG.Text := MeRG.Text;

  if (MeDataNasc.Text = '  /  /    ') then
    TBDATA_NASCIMENTO.Clear
  else
  Begin
    if (not DataValida(MeDataNasc.Text)) then
    Begin
      MessageDlg('Data de Nascimento inválida.', mtWarning, [mbOK], 0);
      MeDataNasc.SetFocus;
      Exit;
    End;
    TBDATA_NASCIMENTO.Text := MeDataNasc.Text;
  end;

  if (TBCODENDERECO.IsNull) or (TBCODENDERECO.Text = '') then
  Begin
    MessageDlg('Informe o Endereço.', mtWarning, [mbOK], 0);
    DBEdit6.SetFocus;
    Exit;
  End;

  if (TBNUMERO.IsNull) or (TBNUMERO.Text = '') then
  Begin
    MessageDlg('Informe o Número.', mtWarning, [mbOK], 0);
    DBEdit5.SetFocus;
    Exit;
  End;

  if (TBCODBAIRRO.IsNull) or (TBCODBAIRRO.Text = '') then
  Begin
    MessageDlg('Informe o Bairro.', mtWarning, [mbOK], 0);
    DBEdit2.SetFocus;
    Exit;
  End;

  if (TBCODCIDADE.IsNull) or (TBCODCIDADE.Text = '') then
  Begin
    MessageDlg('Informe a Cidade.', mtWarning, [mbOK], 0);
    DBEdit7.SetFocus;
    Exit;
  End;

  if TB.State = dsInsert then
    TBDATA_CADASTRO.Value := Date;

  inherited;

end;

end.
