unit UControleCargaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, Grids, DBGrids, Db, variants;

type
  TFControleCargaCons = class(TForm)
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
    BtProcurar: TBitBtn;
    METexto: TMaskEdit;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    DSConsulta: TDataSource;
    Label2: TLabel;
    MEDtVencimento: TMaskEdit;
    METransportador: TMaskEdit;
    SBTransportador: TSpeedButton;
    EDTransportador: TEdit;
    Label3: TLabel;
    MEMotorista: TMaskEdit;
    SBMotorista: TSpeedButton;
    EDMotorista: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    MEEmbarque: TMaskEdit;
    SBEmbarque: TSpeedButton;
    MEViagemPara: TMaskEdit;
    Label6: TLabel;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure SBTransportadorClick(Sender: TObject);
    procedure SBMotoristaClick(Sender: TObject);
    procedure MEMotoristaExit(Sender: TObject);
    procedure METransportadorExit(Sender: TObject);
    procedure SBEmbarqueClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FControleCargaCons: TFControleCargaCons;

implementation

uses UControleCarga_cl, UCadastroCons, UCadastro_cl, UMotoristaCons,
  UMotorista_cl, UOracle_cl, UEmbarqueCons, UEmbarque_cl;

{$R *.DFM}

procedure TFControleCargaCons.DBGrid1DblClick(Sender: TObject);
begin
  Self.ModalResult := mrOk;
end;

procedure TFControleCargaCons.FormActivate(Sender: TObject);
begin

  If (METexto.Enabled) and (METexto.Visible) Then
  METexto.SetFocus;
end;

procedure TFControleCargaCons.BtProcurarClick(Sender: TObject);
begin
  With DMControleCarga do
  Begin
    QControleCargaCons.Close;

    If Trim(METexto.text)<>'' then
      QControleCargaCons.SetVariable('DT_SAIDA',(Trim(METexto.Text)))
    Else
      QControleCargaCons.SetVariable('DT_SAIDA',Null);

    If Trim(MEDtVencimento.text)<>'' then
      QControleCargaCons.SetVariable('DT_VENCIMENTO',(Trim(MEDtVencimento.Text)))
    Else
      QControleCargaCons.SetVariable('DT_VENCIMENTO',Null);

    If Trim(MEEmbarque.text)<>'' then
      QControleCargaCons.SetVariable('COD_EMBARQUE',strtoint(Trim(MEEmbarque.Text)))
    Else
      QControleCargaCons.SetVariable('COD_EMBARQUE',Null);

    If Trim(METransportador.text)<>'' then
      QControleCargaCons.SetVariable('COD_TRANSPORTADOR',strtoint(Trim(METransportador.Text)))
    Else
      QControleCargaCons.SetVariable('COD_TRANSPORTADOR',Null);

    If Trim(MEMotorista.text)<>'' then
      QControleCargaCons.SetVariable('COD_MOTORISTA',strtoint(Trim(MEMotorista.Text)))
    Else
      QControleCargaCons.SetVariable('COD_MOTORISTA',Null);

    If Trim(MEViagemPara.text)<>'' then
      QControleCargaCons.SetVariable('DESC_VIAGEM_PARA',(Trim(MEViagemPara.Text)))
    Else
      QControleCargaCons.SetVariable('DESC_VIAGEM_PARA',Null);

    QControleCargaCons.Open;
  End;
end;

procedure TFControleCargaCons.SBTransportadorClick(Sender: TObject);
begin
  if FCadastroCons = nil then
    FCadastroCons:=TFCadastroCons.create(application);
  if FCadastroCons.showmodal = mrOk then
  begin
    METransportador.Text := inttostr(DMCadastro.QCadastroConsCOD_CADASTRO.value);
    METransportadorExit(self);
  end;
end;

procedure TFControleCargaCons.SBMotoristaClick(Sender: TObject);
begin
   if FCadastroCons = nil then
     FCadastroCons:=TFCadastroCons.create(application);
   if FCadastroCons.showmodal = mrOk then
   begin
     MEMotorista.Text := inttostr(DMCadastro.QCadastroConsCOD_CADASTRO.value);
     MEMotoristaExit(self);
   end;
end;

procedure TFControleCargaCons.MEMotoristaExit(Sender: TObject);
begin
  if trim(MEMotorista.text) <> '' then
    EDMotorista.Text := DMOracle.buscaNome('SELECT NOME FROM TB_CADASTRO',' COD_CADASTRO = ' + MEMotorista.Text)
  else
    EDMotorista.Text := 'Todos';
end;

procedure TFControleCargaCons.METransportadorExit(Sender: TObject);
begin
  if trim(METransportador.text) <> '' then
    EDTransportador.text := DMOracle.buscaNome('SELECT NOME FROM TB_CADASTRO',' COD_CADASTRO = ' + METransportador.Text)
  else
    EDTransportador.text := 'Todos';
end;

procedure TFControleCargaCons.SBEmbarqueClick(Sender: TObject);
begin
  if FEmbarqueCons = nil then
    FEmbarqueCons:=TFEmbarqueCons.create(application);
  if FEmbarqueCons.showmodal = mrOk then
    MEEmbarque.Text := inttostr(DMEmbarque.QEmbarqueConsCOD_EMBARQUE.value);
end;

end.
