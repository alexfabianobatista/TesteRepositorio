unit UVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, Buttons;

type
  TFVenda = class(TForm)
    Panel1: TPanel;
    Label6: TLabel;
    SpeedButton2: TSpeedButton;
    MeCodVendedor: TMaskEdit;
    EVendedor: TEdit;
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
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MeCodVendedorChange(Sender: TObject);
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
  FVenda: TFVenda;

implementation

uses UDmVendedor, UVendedorCad, UFuncoes, UVeiculoCad, UClienteCad,
  UDmVenda, DB, IBQuery, UDmSistema, UDmVeiculo, UDmCliente;

{$R *.dfm}

procedure TFVenda.SpeedButton2Click(Sender: TObject);
begin
  Application.CreateForm(TFVendedorCad, FVendedorCad);
  FVendedorCad.Consultando := True;
  FVendedorCad.ShowModal;

  if RetornoConsulta > -1 then
    MeCodVendedor.Text := IntToStr(RetornoConsulta)
  else
    MeCodVendedor.Clear;

  MeCodVendedor.SetFocus;
end;

procedure TFVenda.FormShow(Sender: TObject);
begin
  MeCodVendedor.SetFocus;
  MeData.Text := FormatDateTime('dd/MM/yyyy', Date);
end;

procedure TFVenda.MeCodVendedorChange(Sender: TObject);
begin
  if MeCodVendedor.Text <> '' then
    EVendedor.Text := BuscaString('NOME', 'TB_VENDEDOR', 'CODVENDEDOR', StrToInt(MeCodVendedor.Text))
  else
    EVendedor.Text := 'TODOS';
end;

procedure TFVenda.SpeedButton1Click(Sender: TObject);
begin
  Application.CreateForm(TFVeiculoCad, FVeiculoCad);
  FVeiculoCad.Consultando := True;
  FVeiculoCad.ShowModal;

  if RetornoConsulta > -1 then
    MeCodVeiculo.Text := IntToStr(RetornoConsulta)
  else
    MeCodVeiculo.Text := 'TODOS';

  MeCodVeiculo.SetFocus;
end;

procedure TFVenda.MeCodVeiculoChange(Sender: TObject);
begin
  if MeCodVeiculo.Text <> '' then
    EVeiculo.Text := BuscaString('DSCVEICULO', 'TB_VEICULO', 'CODVEICULO', StrToInt(MeCodVeiculo.Text))
  else
    EVeiculo.Text := 'TODOS';
end;

procedure TFVenda.SpeedButton3Click(Sender: TObject);
begin
  Application.CreateForm(TFClienteCad, FClienteCad);
  FClienteCad.Consultando := True;
  FClienteCad.ShowModal;

  if RetornoConsulta > -1 then
    MeCodCliente.Text := IntToStr(RetornoConsulta)
  else
    MeCodCliente.Text := 'TODOS';

  MeCodCliente.SetFocus;
end;

procedure TFVenda.MeCodClienteChange(Sender: TObject);
begin
  if MeCodCliente.Text <> '' then
    ECliente.Text := BuscaString('NOME', 'TB_CLIENTE', 'CODCLIENTE', StrToInt(MeCodCliente.Text))
  else
    ECliente.Clear;
end;

procedure TFVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFVenda.BtnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFVenda.BtnGravarClick(Sender: TObject);
begin
  if MeCodVendedor.Text = '' then
  Begin
    MessageDlg('Informe o Vendedor.', mtWarning, [mbOK], 0);
    MeCodVendedor.SetFocus;
    Exit;
  End;

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
    MessageDlg('Data da Venda inválida.', mtWarning, [mbOK], 0);
    MeData.SetFocus;
    Exit;
  End;

  try
    StrToCurr(EValor.Text);
  except
    MessageDlg('Valor da Venda inválido.', mtWarning, [mbOK], 0);
    EValor.SetFocus;
    Exit;
  End;

  DmVeiculo.QJaVendido.Close;
  DmVeiculo.QJaVendido.ParamByName('CODVEICULO').AsInteger := StrToInt(MeCodVeiculo.Text);
  DmVeiculo.QJaVendido.Open;

  if (not DmVeiculo.QJaVendido.IsEmpty) then
  Begin
    MessageDlg('Veículo já vendido.', mtWarning, [mbOK], 0);
    MeCodVeiculo.SetFocus;
    Exit;
  End;

  EValor.Text := CurrToStr(round(StrToCurr(EValor.Text)));

    DmSistema.TSistema.CommitRetaining;

    try
      with DmVenda.QInsVenda do
      Begin
        DmVenda.QUltVenda.Close;
        DmVenda.QUltVenda.Open;

        Close;
        ParamByName('CODVENDA').AsInteger := DmVenda.QUltVendaULTIMA.Value + 1;
        ParamByName('CODVENDEDOR').AsInteger := StrToInt(MeCodVendedor.Text);
        ParamByName('CODVEICULO').AsInteger := StrToInt(MeCodVeiculo.Text);
        ParamByName('CODCLIENTE').AsInteger := StrToInt(MeCodCliente.Text);
        ParamByName('DTVENDA').AsDate := StrToDate(MeData.Text);
        ExecSQL;
      End;

      with DmVeiculo.QUpValorVenda do
      Begin
        Close;
        ParamByName('CODVEICULO').AsInteger := StrToInt(MeCodVeiculo.Text);
        ParamByName('VALORVENDA').AsFloat := StrToCurr(EValor.Text);
        ExecSQL;
      End;
    except
      DmSistema.TSistema.RollbackRetaining;
      Exit;
    end;

    DmSistema.TSistema.CommitRetaining;

    MessageDlg('Venda realizada com sucesso.', mtInformation, [mbOK], 0);
    BtnCancelar.Click;
end;

procedure TFVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_escape then
    BtnCancelar.Click;
end;

end.
