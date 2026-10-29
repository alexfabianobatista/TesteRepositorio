unit UCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, Buttons;

type
  TFCompra = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    MeCodVeiculo: TMaskEdit;
    EVeiculo: TEdit;
    Label2: TLabel;
    SpeedButton3: TSpeedButton;
    MeCodCliente: TMaskEdit;
    ECliente: TEdit;
    Label7: TLabel;
    MeData: TMaskEdit;
    Label3: TLabel;
    EValor: TEdit;
    BtnGravar: TBitBtn;
    BtnCancelar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure MeCodVeiculoChange(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure MeCodClienteChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCompra: TFCompra;

implementation

uses UFuncoes, UVeiculoCad, UClienteCad,
  DB, IBQuery, UDmSistema, UDmVeiculo, UDmCompra;

{$R *.dfm}

procedure TFCompra.FormShow(Sender: TObject);
begin
  MeCodVeiculo.SetFocus;
  MeData.Text := FormatDateTime('dd/MM/yyyy', Date);
end;

procedure TFCompra.SpeedButton1Click(Sender: TObject);
begin
  Application.CreateForm(TFVeiculoCad, FVeiculoCad);
  FVeiculoCad.Consultando := True;
  FVeiculoCad.ShowModal;

  if RetornoConsulta > -1 then
    MeCodVeiculo.Text := IntToStr(RetornoConsulta)
  else
    MeCodVeiculo.Clear;

  MeCodVeiculo.SetFocus;
end;

procedure TFCompra.MeCodVeiculoChange(Sender: TObject);
begin
  if MeCodVeiculo.Text <> '' then
    EVeiculo.Text := BuscaString('DSCVEICULO', 'TB_VEICULO', 'CODVEICULO', StrToInt(MeCodVeiculo.Text))
  else
    EVeiculo.Clear;
end;

procedure TFCompra.SpeedButton3Click(Sender: TObject);
begin
  Application.CreateForm(TFClienteCad, FClienteCad);
  FClienteCad.Consultando := True;
  FClienteCad.ShowModal;

  if RetornoConsulta > -1 then
    MeCodCliente.Text := IntToStr(RetornoConsulta)
  else
    MeCodCliente.Clear;

  MeCodCliente.SetFocus;
end;

procedure TFCompra.MeCodClienteChange(Sender: TObject);
begin
  if MeCodCliente.Text <> '' then
    ECliente.Text := BuscaString('NOME', 'TB_CLIENTE', 'CODCLIENTE', StrToInt(MeCodCliente.Text))
  else
    ECliente.Clear;
end;

procedure TFCompra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFCompra.BtnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFCompra.BtnGravarClick(Sender: TObject);
begin
  if MeCodVeiculo.Text = '' then
  Begin
    MessageDlg('Informe o Veículo.', mtWarning, [mbOK], 0);
    MeCodVeiculo.SetFocus;
    Exit;
  End;

  if MeCodCliente.Text = '' then
  Begin
    MessageDlg('Informe o Cliente.', mtWarning, [mbOK], 0);
    MeCodCliente.SetFocus;
    Exit;
  End;

  if (not DataValida(MeData.Text)) then
  Begin
    MessageDlg('Data da Compra inválida.', mtWarning, [mbOK], 0);
    MeData.SetFocus;
    Exit;
  End;

  try
    StrToCurr(EValor.Text);
  except
    MessageDlg('Valor da Compra inválido.', mtWarning, [mbOK], 0);
    EValor.SetFocus;
    Exit;
  End;

  DmVeiculo.QJaComprado.Close;
  DmVeiculo.QJaComprado.ParamByName('CODVEICULO').AsInteger := StrToInt(MeCodVeiculo.Text);
  DmVeiculo.QJaComprado.Open;

  if (not DmVeiculo.QJaComprado.IsEmpty) then
  Begin
    MessageDlg('Veículo já comprado.', mtWarning, [mbOK], 0);
    MeCodVeiculo.SetFocus;
    Exit;
  End;

  EValor.Text := CurrToStr(round(StrToCurr(EValor.Text)));

    DmSistema.TSistema.CommitRetaining;

    try
      with DmCompra.QInsCompra do
      Begin
        DmCompra.QUltCompra.Close;
        DmCompra.QUltCompra.Open;

        Close;
        ParamByName('CODCOMPRA').AsInteger := DmCompra.QUltCompraULTIMA.Value + 1;
        ParamByName('CODVEICULO').AsInteger := StrToInt(MeCodVeiculo.Text);
        ParamByName('CODCLIENTE').AsInteger := StrToInt(MeCodCliente.Text);
        ParamByName('DTCOMPRA').AsDate := StrToDate(MeData.Text);
        ExecSQL;
      End;

      with DmVeiculo.QUpValorCompra do
      Begin
        Close;
        ParamByName('CODVEICULO').AsInteger := StrToInt(MeCodVeiculo.Text);
        ParamByName('VALORCOMPRA').AsFloat := StrToCurr(EValor.Text);
        ExecSQL;
      End;
    except
      DmSistema.TSistema.RollbackRetaining;
      Exit;
    end;

    DmSistema.TSistema.CommitRetaining;

    MessageDlg('Compra realizada com sucesso.', mtInformation, [mbOK], 0);
    BtnCancelar.Click;
end;

procedure TFCompra.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_escape then
    BtnCancelar.Click;
end;

end.
