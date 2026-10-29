unit UNotaComprovanteEntrega;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask;

type
  TFNotaComprovanteEntrega = class(TForm)
    Label1: TLabel;
    EdMotorista: TEdit;
    Label2: TLabel;
    EdPlaca: TEdit;
    BtOk: TBitBtn;
    BtSair: TBitBtn;
    BtImprimir: TBitBtn;
    SBMotorista: TSpeedButton;
    MEMotorista: TMaskEdit;
    EdPedido: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    SBPedido: TSpeedButton;
    procedure BtOkClick(Sender: TObject);
    procedure BtSairClick(Sender: TObject);
    procedure BtImprimirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SBMotoristaClick(Sender: TObject);
    procedure SBPedidoClick(Sender: TObject);
    procedure MEMotoristaExit(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNotaComprovanteEntrega: TFNotaComprovanteEntrega;

implementation

uses UOracle_cl, UNotaSaida_cl, URComprovanteEntrega, UCadastroCons,
  UPedido_ConsAberto, UCadastro_cl, UPedidoCons, UPedido_cl;

{$R *.DFM}

procedure TFNotaComprovanteEntrega.BtOkClick(Sender: TObject);
var
  wSql :String;
begin
With DMOracle do
  Begin
    if (Trim(EdMotorista.Text) <> '') and (Trim(EdPlaca.text) <> '') then
    begin
      if Trim(EdPedido.text) <> '' then
        wSql:='UPDATE TB_NOTA_CAB SET DESC_TRANSPORTADORA = '+CHR(39)+Trim(EdMotorista.Text)+CHR(39)+
                                               ', DESC_PLACA = '+CHR(39) + Trim(EdPlaca.text)+chr(39)+
                                               ', NUM_PEDIDO = '+Trim(EdPedido.text)+
                                               ' WHERE COD_NOTA_CAB = '+Trim(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Text)
      else
        wSql:='UPDATE TB_NOTA_CAB SET DESC_TRANSPORTADORA = '+CHR(39)+Trim(EdMotorista.Text)+CHR(39)+
                                               ', DESC_PLACA = '+CHR(39) + Trim(EdPlaca.text)+chr(39)+
                                               ' WHERE COD_NOTA_CAB = '+Trim(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Text);
      try
        DBCemapa.StartTransaction;
        QExecSQL.Close;
        QExecSQL.SQL.Clear;
        QExecSQL.SQL.Add(wSql);
        QExecSQL.ExecSQL;
      DMNotaSaida.QNotaSaida.RefreshRecord;
      DBCemapa.Commit;
    except
      DBCemapa.Rollback;
    end;
   end;
  EdMotorista.SetFocus;
 end;
 end;

procedure TFNotaComprovanteEntrega.BtSairClick(Sender: TObject);
begin
close;
end;

procedure TFNotaComprovanteEntrega.BtImprimirClick(Sender: TObject);
begin
  DMNotaSaida.QNotaSaida.close;
  DMNotaSaida.QitemNF.close;
  DMNotaSaida.QNotaSaida.Open;
  DMNotaSaida.QitemNF.open;
  if  Trim(DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text) = '' then
     Raise Exception.Create('Informe a nota para gerar o Comprovante de Entrega');
  if FRComprovanteEntrega = nil then
     FRComprovanteEntrega := TFRComprovanteEntrega.Create(Application);
     FRComprovanteEntrega.QRPrimario.Preview;
end;

procedure TFNotaComprovanteEntrega.FormActivate(Sender: TObject);
begin
  EdMotorista.Text := DMNotaSaida.QNotaSaidaDESC_TRANSPORTADORA.Value;
  EdPlaca.text := DMNotaSaida.QNotaSaidaDESC_PLACA.Value;
  MeMotorista.text :=DMNotaSaida.QNotaSaidaCOD_TRANSPORTADOR.Text;
  EdPedido.text :=DMNotaSaida.QNotaSaidaNUM_PEDIDO.Text;
end;

procedure TFNotaComprovanteEntrega.SBMotoristaClick(Sender: TObject);
begin
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    MeMotorista.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    EdMotorista.Text := DMCadastro.QCadastroConsNome.value;
end;

procedure TFNotaComprovanteEntrega.SBPedidoClick(Sender: TObject);
begin
    If FPedidoCons = Nil then
    FPedidoCons := TFPedidoCons.Create(Application);
    If FPedidoCons.ShowModal = mrOk then
    EdPedido.Text := DMPedido.QPedidoConsNum_Pedido.Text;

end;

procedure TFNotaComprovanteEntrega.MEMotoristaExit(Sender: TObject);
begin
  If Trim(MEMotorista.Text) <> '' Then
    EdMotorista.text:=DMOracle.BuscaNome('SELECT NOME FROM  TB_CADASTRO',
                    'COD_CADASTRO = '+MEMotorista.text)
 
end;

end.



