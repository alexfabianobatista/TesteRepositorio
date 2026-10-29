unit UMilhagem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGrids, StdCtrls, Buttons, Mask;

type
  TFMIlhagem = class(TForm)
    Label57: TLabel;
    SBProcura: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    MeDtInicial: TMaskEdit;
    MeDtFinal: TMaskEdit;
    MEFilial: TMaskEdit;
    BtConsFilial: TBitBtn;
    EdFilial: TEdit;
    DBGrid1: TDBGrid;
    DsMilhagem: TDataSource;
    SBAtendido: TSpeedButton;
    Label108: TLabel;
    MECadastro: TMaskEdit;
    BtCadastro: TBitBtn;
    EdCadastro: TEdit;
    procedure MEFilialExit(Sender: TObject);
    procedure BtConsFilialClick(Sender: TObject);
    procedure SBProcuraClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure MECadastroExit(Sender: TObject);
    procedure BtCadastroClick(Sender: TObject);
    procedure SBAtendidoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMIlhagem: TFMIlhagem;

implementation

uses UNotaSaida_cl, UFilial_cl, UCadastro_cl, UCadastroCons, UOracle_cl,
  UFilialCons, UNotaSaidaParam, URMilhagem, URelatorioVenda_cl;

{$R *.DFM}

procedure TFMIlhagem.MEFilialExit(Sender: TObject);
begin
  if Trim(MEFilial.Text) <> '' Then
  with DMFilial do
  begin
    QFilial.Close;
    QFilial.SetVariable('PK',MEFilial.Text);
    QFilial.Open;
    EdFilial.Text := QFilialDesc_Filial.Value;
  end
  else
    EdFilial.Text := 'Todos';
end;

procedure TFMIlhagem.BtConsFilialClick(Sender: TObject);
begin
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
  begin
    MEFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
    MEFilialExit(Self);
  End;

end;

procedure TFMIlhagem.SBProcuraClick(Sender: TObject);
begin
  with DMNotaSaida do
  begin
    QMilhagem.Close;

    if Trim(FMilhagem.MeDtInicial.Text)= ''   then
       QMilhagem.SetVariable('DATA_I',Null)
    else
      QMilhagem.SetVariable('DATA_I',StrToDate(FMilhagem.MeDtInicial.Text));
    if Trim(FMilhagem.MeDtFinal.Text)= ''   then
      QMilhagem.SetVariable('DATA_F',Null)
    else
      QMilhagem.SetVariable('DATA_F',StrToDate(FMilhagem.MeDtFinal.Text));
    if Trim(FMilhagem.MeFilial.Text)= ''   then
      QMilhagem.SetVariable('FILIAL',Null)
    else
      QMilhagem.SetVariable('FILIAL',FMilhagem.MeFilial.Text);

    if Trim(FMilhagem.MECadastro.Text) = '' then
       QMilhagem.SetVariable('CADASTRO',Null)
    else
       QMilhagem.SetVariable('CADASTRO',FMilhagem.MECadastro.Text);

    QMilhagem.Open;

  end;

end;

procedure TFMIlhagem.SpeedButton2Click(Sender: TObject);
begin
  if FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
    FNotaSaidaParam.PGRelatorio.Pages[28].TabVisible := True;

  if FNotaSaidaParam.ShowModal = mrOk then
  with DMRelatorio_Venda do
  begin
    QRMilhagem.Close;
    QRMilhagem.SetVariable('DATA_I',FMilhagem.MEDtInicial.Text);
    QRMilhagem.SetVariable('DATA_F',FMilhagem.MEDtFinal.Text);

    if Trim(FMilhagem.MEFilial.Text)= ''   then
       QRMilhagem.SetVariable('FILIAL',Null)
    else
       QRMilhagem.SetVariable('FILIAL',FMilhagem.MEFilial.Text);

    if Trim(FMilhagem.MECadastro.Text)= ''   then
       QRMilhagem.SetVariable('CADASTRO',Null)
    else
       QRMilhagem.SetVariable('CADASTRO',FMilhagem.MECadastro.Text);

    QRMilhagem.Open;
    if FRMilhagem = Nil then
       FRMilhagem := TFRMilhagem.Create(Application);

    FRMilhagem.QRLFilial.Caption := 'Filial:'+FMilhagem.EdFilial.Text;
    FRMilhagem.QRLTitulo.Caption := 'Milhagem do Periodo '+FMilhagem.MEDtInicial.Text+' até '+FMilhagem.MEDtFinal.Text;
    FRMilhagem.QRLComissao.Caption := FNotaSaidaParam.ME28Percentual.Text + '%';
    if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
       FRMilhagem.QRPrimario.Preview
    Else
       FRMilhagem.QRPrimario.Print;

    FRMilhagem.Close;
  end
end;

procedure TFMIlhagem.MECadastroExit(Sender: TObject);
begin
  if Trim(MECadastro.Text) <> '' Then
  with DMCadastro do
  begin
    QCadastro.Close;
    QCadastro.SetVariable('PK',MECadastro.Text);
    QCadastro.Open;
    EdCadastro.Text := QCadastroNome.Value;
  end
  else
    EdCadastro.Text := 'Todos';

end;

procedure TFMIlhagem.BtCadastroClick(Sender: TObject);
begin
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
  begin
    MECadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    MECadastroExit(Self);
  end;

end;

procedure TFMIlhagem.SBAtendidoClick(Sender: TObject);
var wSimNao,wComando:String;
begin
  wSimNao := 'NAO';
  if DMNotaSaida.QMilhagemIND_MILHAGEM.Value = 'NAO' then
     wSimNao := 'SIM';
  with DMOracle do
  begin
    QExecSQL.Close;
    QExecSQL.SQL.Clear;
    wComando := 'UPDATE TB_NOTA_CAB SET IND_MILHAGEM = '+ chr(39) + wSimNao +chr(39);
    wComando := wComando + ' WHERE COD_NOTA_CAB = '+FloatToStr(DMNotaSaida.QMilhagemCOD_NOTA_CAB.Value);
    QExecSQL.SQL.Add(wComando);
    QExecSQL.ExecSQL;
  End;
  DMNotaSaida.QMilhagem.Close;
  DMNotaSaida.QMilhagem.Open;


end;

procedure TFMIlhagem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
  FMIlhagem := Nil;
end;

end.
