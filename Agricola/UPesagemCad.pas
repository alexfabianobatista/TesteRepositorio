unit UPesagemCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids, DBDirceu, UBiblioteca, ActnList,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFPesagemCad = class(TFTCadSimples)
    RgTipoRomaneio: TDBRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SBConsFilial: TSpeedButton;
    SBConsCadastro: TSpeedButton;
    SBConsProduto: TSpeedButton;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    SBConsTransportadora: TSpeedButton;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox8: TGroupBox;
    Label15: TLabel;
    Label24: TLabel;
    GroupBox11: TGroupBox;
    Label21: TLabel;
    Label48: TLabel;
    GroupBox9: TGroupBox;
    Label17: TLabel;
    Label42: TLabel;
    GroupBox10: TGroupBox;
    Label16: TLabel;
    Label43: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit11: TDBEdit;
    DBDirceu4: TDBDirceu;
    DBDirceu5: TDBDirceu;
    DBDirceu2: TDBDirceu;
    DBEdit59: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit36: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit51: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit52: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit53: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit57: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit1: TDBEdit;
    GroupBox5: TGroupBox;
    DBEdit30: TDBEdit;
    DBDirceu1: TDBDirceu;
    Label20: TLabel;
    DBEdit10: TDBEdit;
    DBEdit12: TDBEdit;
    Label22: TLabel;
    DBEdit56: TDBEdit;
    DBDirceu3: TDBDirceu;
    LblPorta: TLabel;
    LblEndereco: TLabel;
    LblTipo: TLabel;
    Label35: TLabel;
    MePesoBalanca: TMaskEdit;
    DBEdit13: TDBEdit;
    SBImpPesagem: TSpeedButton;
    edtDifBalanca: TEdit;
    Label23: TLabel;
    edtEmailCadastro: TLabeledEdit;
    Label25: TLabel;
    EmitirPesagem1: TMenuItem;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SBConsFilialClick(Sender: TObject);
    procedure SBConsCadastroClick(Sender: TObject);
    procedure SBConsProdutoClick(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
    procedure DBEdit6Change(Sender: TObject);
    procedure DBEdit30Exit(Sender: TObject);
    procedure SBConsTransportadoraClick(Sender: TObject);
    procedure RgTipoRomaneioChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure DBEdit4Change(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure SBImpPesagemClick(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure EmitirPesagem1Click(Sender: TObject);
  private
    { Private declarations }
    function LeituraDePeso(porta : integer) : double;
    procedure calculaDiferencaPeso;
    procedure buscaEmailCadastro;

  public
    { Public declarations }
  end;

var
  FPesagemCad: TFPesagemCad;
  { DECLARAÇÃO DAS FUNÇÕES DA DLL DE LEITURA DE PESO }
    function LePeso1 : double; stdcall;    external 'PesoSaturno_v10.dll' name 'LePeso1';
    function LePeso2 : double; stdcall;    external 'PesoSaturno_v10.dll' name 'LePeso2';
    function LePeso3 : double; stdcall;    external 'PesoSaturno_v10.dll' name 'LePeso3';
    function LePeso4 : double; stdcall;    external 'PesoSaturno_v10.dll' name 'LePeso4';
    Function ConfiguraRs(Porta:String):Integer; StdCall; External 'peso32.dll';
    Function LePeso(Parametro:String):Integer; StdCall; External 'peso32.dll';

implementation

uses UOracle_cl, UUsuario_cl, URomaneioAgricola_cl, UFilialCons,
  UCadastroCons, UProdutoCons, UProdutoAgricola_cl, UParamSistema_cl,
  UFilial_cl, UCadastro_cl, UProduto_cl, UNotaSaida_cl, URomaneioImpressao,
  URomaneioCons, Variants;

{$R *.DFM}

// Usa a funcao de leitura de peso conforme parametro da porta
function TFPesagemCad.LeituraDePeso(porta : integer) : double;
begin
  case porta of
    1: Result:=LePeso1;
    2: Result:=LePeso2;
    3: Result:=LePeso3;
    4: Result:=LePeso4;
  end;
end;

procedure TFPesagemCad.SpeedButton2Click(Sender: TObject);
Var wPorta_Serial, i : Integer;
    wPorta, ConfigRs, wStr,wBalanca:String;
begin
  inherited;
  wPorta := DMOracle.BuscaNome('SELECT IND_PORTA_BALANCA FROM TB_FILIAL','COD_FILIAL=' +FloatToStr(DMUsuario.CodFilialUsuario));
  wBalanca := DMOracle.BuscaNome('SELECT DESC_TIPO_BALANCA FROM TB_FILIAL','COD_FILIAL=' +FloatToStr(DMUsuario.CodFilialUsuario));
  LblPorta.Caption := wPorta;
  wPorta_Serial := 2;
  If wPorta = 'Com1' Then
   Begin
    wPorta_Serial := 1;
    LblEndereco.Caption := IntToStr(wPorta_Serial);
   End;
  If wPorta = 'Com2' Then
   Begin
    wPorta_Serial := 2;
    LblEndereco.Caption := IntToStr(wPorta_Serial);
   End;
  If wPorta = 'Com3' Then
   Begin
    wPorta_Serial := 3;
    LblEndereco.Caption := IntToStr(wPorta_Serial);
   End;
  If wPorta = 'Com4' Then
   Begin
    wPorta_Serial := 4;
    LblEndereco.Caption := IntToStr(wPorta_Serial);
   End;
  If wBalanca = 'EPM' Then
   Begin
     ConfigRs := UpperCase(wPorta) + ':9600,E,8,2';
     ConfiguraRs(ConfigRs);
     //Captura Do peso
     wStr := '';
     For I:=1 to 50 do
        wStr := wStr + chr(32);
     If LePeso(wStr) <> 0 Then
        DMRomaneioAgricola.QRomaneioQT_PESO_BRUTO.Value := StrToInt(Copy(wStr,1,7));
   End
  Else
    DMRomaneioAgricola.QRomaneioQT_PESO_BRUTO.Value := Trunc(LeituraDePeso(wPorta_Serial));
End;

procedure TFPesagemCad.SpeedButton3Click(Sender: TObject);
Var wPorta_Serial, i : Integer;
    wPorta, ConfigRs, wStr,wBalanca:String;
begin
  inherited;
  wPorta := DMOracle.BuscaNome('SELECT IND_PORTA_BALANCA FROM TB_FILIAL','COD_FILIAL=' +FloatToStr(DMUsuario.CodFilialUsuario));
  wBalanca := DMOracle.BuscaNome('SELECT DESC_TIPO_BALANCA FROM TB_FILIAL','COD_FILIAL=' +FloatToStr(DMUsuario.CodFilialUsuario));
  LblPorta.Caption := wPorta;
  wPorta_Serial := 2;
  If wPorta = 'Com1' Then
   Begin
    wPorta_Serial := 1;
    LblEndereco.Caption := IntToStr(wPorta_Serial);
   End;
  If wPorta = 'Com2' Then
   Begin
    wPorta_Serial := 2;
    LblEndereco.Caption := IntToStr(wPorta_Serial);
   End;
  If wPorta = 'Com3' Then
   Begin
    wPorta_Serial := 3;
    LblEndereco.Caption := IntToStr(wPorta_Serial);
   End;
  If wPorta = 'Com4' Then
   Begin
    wPorta_Serial := 4;
    LblEndereco.Caption := IntToStr(wPorta_Serial);
   End;
  If wBalanca = 'EPM' Then
   Begin
     ConfigRs := UpperCase(wPorta) + ':9600,E,8,2';
     ConfiguraRs(ConfigRs);
     //Captura Do peso
     wStr := '';
     For I:=1 to 50 do
        wStr := wStr + chr(32);
     If LePeso(wStr) <> 0 Then
        DMRomaneioAgricola.QRomaneioQT_TARA.Value := StrToInt(Copy(wStr,1,7));
   End
  Else
    DMRomaneioAgricola.QRomaneioQT_TARA.Value := Trunc(LeituraDePeso(wPorta_Serial));
end;

procedure TFPesagemCad.SBConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOK then
     DMRomaneioAgricola.QRomaneioCod_Filial.Value := DMFilial.QFilialConsCod_Filial.Value;
end;

procedure TFPesagemCad.SBConsCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
     DMRomaneioAgricola.QRomaneioCod_Cadastro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFPesagemCad.SBConsProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOK then
   Begin
     DMRomaneioAgricola.QRomaneioCod_Produto.Value := DMProduto.QProdutoConsCod_Produto.Value;
     DBEdit7Exit(Self);
   end;  
end;

procedure TFPesagemCad.DBEdit7Exit(Sender: TObject);
begin
  inherited;
  With DMProdutoAgricola do
  Begin
    QProdutoAgricola.Close;
    QProdutoAgricola.setVariable('PK',DMRomaneioAgricola.QRomaneioCod_Produto.Value);
    QProdutoAgricola.Open;
    If DMRomaneioAgricola.QRomaneioPerc_Tolera_Ardidos.Value = 0 Then
       DMRomaneioAgricola.QRomaneioPerc_Tolera_Ardidos.Value := QProdutoAgricolaPerc_Tolera_Ardidos.Value;
    If DMRomaneioAgricola.QRomaneioPerc_Tolera_Impureza.Value = 0 Then
       DMRomaneioAgricola.QRomaneioPerc_Tolera_Impureza.Value := QProdutoAgricolaPerc_Tolera_Impureza.Value;
    If DMRomaneioAgricola.QRomaneioPerc_Tolera_Avariado.Value = 0 Then
       DMRomaneioAgricola.QRomaneioPerc_Tolera_Avariado.Value := QProdutoAgricolaPerc_Tolera_Avariado.Value;
    QProdutoAgricola.Close;
  End;

end;

procedure TFPesagemCad.DBEdit6Change(Sender: TObject);
begin
  inherited;
  If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB') And
     (Trim(DbEdit6.Text) <> '') Then
  begin
     DMNotaSaida.MostraMsg(StrToInt(Trim(DbEdit6.Text)));
     buscaEmailCadastro;
  end;


end;

procedure TFPesagemCad.DBEdit30Exit(Sender: TObject);
Var wLote : String;
begin
  inherited;
  If (DMRomaneioAgricola.QRomaneioPERC_PH.VALUE <> 0) And (DMRomaneioAgricola.QRomaneioPERC_PH.Text <> '') Then
   Begin
    wLote := DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO','COD_LOTE_TIPO=' +FloatToStr(DMRomaneioAgricola.QRomaneioPERC_PH.VALUE));
    If wLote = '' Then
       Raise Exception.Create ('Tipo de PH Não Cadastrado');
   End;
end;

procedure TFPesagemCad.SBConsTransportadoraClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
     DMRomaneioAgricola.QRomaneioCod_Transportadora.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;

end;

procedure TFPesagemCad.RgTipoRomaneioChange(Sender: TObject);
begin
  inherited;
  Case RgTipoRomaneio.ItemIndex Of
   0 : LblTipo.caption := 'PESAGEM ENTRADA';
   1 : LblTipo.caption := 'PESAGEM SAIDA';
   2 : LblTipo.caption := 'PESAGEM PARTICULAR'; 
  End;

end;

procedure TFPesagemCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMRomaneioAgricola.QRomaneio.Open;
  DMRomaneioAgricola.QRateio.open;
end;

procedure TFPesagemCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DmRomaneioAgricola.QRomaneio.Close;
  DMRomaneioAgricola.QRateio.Close;
  Action := CaFree;
  FPesagemCad := Nil;
end;  

procedure TFPesagemCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  //SBImprime.Enabled := ( (DMRomaneioAgricola.QRomaneio.State = dsBrowse)
  //                       and (DMRomaneioAgricola.QRomaneioCod_Romaneio_Agricola.Value > 0) );
  if DSPrimario.State in [DSInsert, DSEdit] then
    begin
      SBConsCadastro.Enabled:=True;
      SBConsProduto.Enabled:=True;
      SBConsTransportadora.Enabled:=True;
      SBConsFilial.Enabled:=True;
    end
  else
    begin
      SBConsCadastro.Enabled:=False;
      SBConsProduto.Enabled:=False;
      SBConsTransportadora.Enabled:=False;
      SBConsFilial.Enabled:=False;
    end;

  calculaDiferencaPeso;
  buscaEmailCadastro;
end;

procedure TFPesagemCad.SBConfirmarClick(Sender: TObject);
Var wLiquido,wDesconto : Real;
begin
  DmUsuario.Checar_Filial_Usuario( Trim(DMRomaneioAgricola.QRomaneioCOD_FILIAL.Text),'AGRICOLA');
  With DMRomaneioAgricola do
  Begin
    CalculoDesconto( StrToFloat(MePesoBalanca.Text),
                                QRomaneioPerc_desconto.Value,
                                QRomaneioPerc_ardidos.Value,
                                QRomaneioPerc_Umidade.Value,
                                QRomaneioPerc_Impureza.Value,
                                QRomaneioPerc_Avariado.Value,
                                QRomaneioPerc_Quebrados.Value,
                                QRomaneioPerc_Diversos.Value,
                                QRomaneioCod_Romaneio_Agricola.Value,
                                QRomaneioCod_Produto.Value,
                                QRomaneioPerc_Triguilho.Value,
                                QRomaneioPerc_Tolera_Ardidos.Value,
                                QRomaneioPerc_Tolera_Impureza.Value,
                                QRomaneioPerc_Tolera_Avariado.Value,
                                QRomaneioPerc_Beneficiado.Value,
                                wLiquido, wDesconto);
  End;    
  If wDesconto > StrToFloat(MePesoBalanca.Text)  Then
     Raise Exception.Create ('Quantidade Desconto Maior Quantidade Romaneio');
  If RGTipoRomaneio.ItemIndex = -1 then
    Raise Exception.Create('Informe o Tipo de Pesagem!');
  If DMRomaneioAgricola.QRomaneio.State = dsInsert then
  Begin
    With DMProdutoAgricola do
    Begin
      QProdutoAgricola.Close;
      QProdutoAgricola.setVariable('PK',DmRomaneioAgricola.QRomaneioCod_Produto.Value);
      QProdutoAgricola.Open;
    End;
    inherited;
    DMRomaneioAgricola.QRomaneio.Edit;
    DMRomaneioAgricola.QRomaneio.Post;
    DMOracle.Dbcemapa.Commit;
  End
  Else
  Begin
    inherited;
    DMOracle.DBCemapa.Commit;
  End;
end;

procedure TFPesagemCad.DBEdit4Change(Sender: TObject);
begin
  inherited;
  MePesoBalanca.Text := FloatToStr(DMRomaneioAgricola.QRomaneioQT_PESO_BRUTO.Value
                                 - DMRomaneioAgricola.QRomaneioQT_TARA.Value);
end;

procedure TFPesagemCad.SBCancelarClick(Sender: TObject);
begin
  inherited;
  MePesoBalanca.Text := '';
end;

procedure TFPesagemCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FRomaneioCons = nil then
     FRomaneioCons := TFRomaneioCons.Create(Application);
  If FRomaneioCons.ShowModal = mrOK then
   with DMRomaneioAgricola do
   begin
     QRomaneio.Close;
     QRomaneio.SetVariable('PK',QRomaneioConsCod_Romaneio_Agricola.Value);
     QRomaneio.Open;
     MePesoBalanca.Text := FloatToStr(QRomaneioQT_PESO_BRUTO.Value
                                       - QRomaneioQT_TARA.Value);
   end;
end;

procedure TFPesagemCad.SBImpPesagemClick(Sender: TObject);
Var wCont : Byte;
wAux : string;
begin
  inherited;
  With DMRomaneioAgricola do
  Begin
  If QRomaneioCod_Romaneio_Agricola.Value = 0 then
       raise exception.create('É necessário Informar uma Pesagem!');
  if Imp = Nil Then
     Imp := TImp.Create;
     Imp.AbreImpressora;
     Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',33);

     wCont := 0;
     wAux := DMOracle.Buscanome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL ='+QRomaneioCOD_FILIAL.Text);
     Imp.WriteXY(1,Wcont,wAux );
     Imp.WriteXY(17,Wcont,DMOracle.QDataServDTSERVIDOR.Text );
     inc(wCont);

     wAux := DMOracle.Buscanome('SELECT DESC_ENDERECO FROM TB_FILIAL','COD_FILIAL ='+QRomaneioCOD_FILIAL.Text);
     Imp.WriteXY(1,Wcont,wAux);
     inc(wCont);

     wAux := DMOracle.Buscanome('SELECT DESC_CIDADE FROM TB_FILIAL','COD_FILIAL ='+QRomaneioCOD_FILIAL.Text);
     Imp.WriteXY(1,Wcont,wAux + ' - ');
     wAux := DMOracle.Buscanome('SELECT COD_ESTADO FROM TB_FILIAL','COD_FILIAL ='+QRomaneioCOD_FILIAL.Text);
     Imp.WriteXY(1,Wcont,wAux);

     Case RgTipoRomaneio.ItemIndex  of
      0 : wAux := 'ENTRADA';
      1 : wAux := 'SAIDA';
      2 : wAux := 'PARTICULAR';
     End;
     Imp.WriteXY(10,Wcont,wAux);
     Imp.WriteXY(17,Wcont,'PESAGEM ' + QRomaneioNUM_ROMANEIO.Text);
     inc(wCont);

     wAux := DMOracle.Buscanome('SELECT DESC_CEP FROM TB_FILIAL','COD_FILIAL ='+QRomaneioCOD_FILIAL.Text);
     Imp.WriteXY(1,Wcont,'CEP ' + wAux);
     wAux := DMOracle.Buscanome('SELECT DESC_TELEFONE FROM TB_FILIAL','COD_FILIAL ='+QRomaneioCOD_FILIAL.Text);
     Imp.WriteXY(6,Wcont,'FONE: ' + wAux);
     inc(wCont);

     Imp.WriteXY(1,Wcont,'-----------------------------------------------------------------------------------------------' );

     wCont := wCont + 1;
     Imp.WriteXY(1,Wcont,'Cliente........:');
     Imp.WriteXY(5,Wcont,QRomaneioCOD_CADASTRO.Text + ' - ');
     wAux := DMOracle.Buscanome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO =' + QRomaneioCOD_CADASTRO.Text);
     Imp.WriteXY(6,Wcont,wAux );
     inc(wCont);

     Imp.WriteXY(1,Wcont,'Tranportadora..:');
     If QRomaneioCod_Transportadora.Text <> '' then
     Begin
       Imp.WriteXY(5,Wcont,QRomaneioCOD_TRANSPORTADORA.Text + ' - ');
       wAux := DMOracle.Buscanome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO =' + QRomaneioCOD_TRANSPORTADORA.Text);
       Imp.WriteXY(6,Wcont,wAux );
     end;
       inc(wCont);

     Imp.WriteXY(1,Wcont,'Motorista......:');
     Imp.WriteXY(5,Wcont,QRomaneioNOME_MOTORISTA.Text);
     inc(wCont);

     Imp.WriteXY(1,Wcont,'Placa Cavalo...:');
     Imp.WriteXY(5,Wcont,QRomaneioDESC_PLACA.Text);
     Imp.WriteXY(8,Wcont,'Placas Carreta.: ');
     Imp.WriteXY(10,Wcont,QRomaneioDESC_PLACA_CARRETA1.Text);
     Imp.WriteXY(15,Wcont,QRomaneioDESC_PLACA_CARRETA2.Text);
     wCont := wcont + 2;

     Imp.WriteXY(1,Wcont,'Produto........:');
     Imp.WriteXY(5,Wcont,QRomaneioCOD_PRODUTO.Text + ' - ');
     wAux := DMOracle.Buscanome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO ='+QRomaneioCOD_PRODUTO.Text);
     Imp.WriteXY(6,Wcont,wAux );
     Imp.WriteXY(13,Wcont,'Classificacao');
     Imp.WriteXY(17,Wcont,'%');
     Imp.WriteXY(18,Wcont,'Desconto');
     inc(wCont);

     Imp.WriteXY(1,Wcont,'Peso Bruto.....:');
     Imp.WriteXY(5,Wcont,QRomaneioQT_PESO_BRUTO.Text);
     Imp.WriteXY(13,Wcont,'Umidade......');
     Imp.WriteXY(17,Wcont,QRomaneioPERC_UMIDADE.Text);
     Imp.WriteXY(19,Wcont,QRomaneioPERC_DESCONTO.Text);
     inc(wCont);
     
     Imp.WriteXY(1,Wcont,'Tara...........:');
     Imp.WriteXY(5,Wcont,QRomaneioQT_TARA.Text);
     Imp.WriteXY(13,Wcont,'Impureza.....');
     Imp.WriteXY(17,Wcont,QRomaneioPERC_IMPUREZA.Text);
     Imp.WriteXY(19,Wcont,QRomaneioPERC_TOLERA_IMPUREZA.Text);
     inc(wCont);

     Imp.WriteXY(1,Wcont,'Total..........:');
     Imp.WriteXY(5,Wcont,IntToStr(QRomaneioQT_PESO_BRUTO.Value - QRomaneioQT_TARA.Value));
     Imp.WriteXY(13,Wcont,'Ardidos......');
     Imp.WriteXY(17,Wcont,QRomaneioPERC_ARDIDOS.Text);
     Imp.WriteXY(19,Wcont,QRomaneioPERC_TOLERA_ARDIDOS.Text);
     inc(wCont);

     Imp.WriteXY(13,Wcont,'Avariados....');
     Imp.WriteXY(17,Wcont,QRomaneioPERC_AVARIADO.Text);
     Imp.WriteXY(19,Wcont,QRomaneioPERC_TOLERA_AVARIADO.Text);
     inc(wCont);

     Imp.WriteXY(1,Wcont,'Total Liquido..:');
     Imp.WriteXY(5,Wcont,IntToStr(QRomaneioQT_PESO_BRUTO.Value - QRomaneioQT_TARA.Value));
     Imp.WriteXY(13,Wcont,'Quebrados....');
     Imp.WriteXY(17,Wcont,QRomaneioPERC_QUEBRADOS.Text);
     Imp.WriteXY(19,Wcont,'0');
     wCont := wCont + 2;

     Imp.WriteXY(1,Wcont,'Observacao.....:');
     Imp.WriteXY(5,Wcont,QRomaneioDESC_OBSERVACAO.Text);
     inc(wCont);

     Imp.WriteXY(1,Wcont,'Nota Fiscal....:');
     Imp.WriteXY(5,Wcont,QRomaneioNUM_NOTA_PRODUTOR.Text + '  ' + QRomaneioDT_EMISSAO_NOTA.Text);
     inc(wCont);

     Imp.WriteXY(1,Wcont,'Peso Origem....:');
     Imp.WriteXY(5,Wcont,QRomaneioQT_PESO_NOTA.Text);
     inc(wCont);

     Imp.WriteXY(1,Wcont,'Variacao.......:');
     Imp.WriteXY(5,Wcont,IntToStr(QRomaneioQT_PESO_NOTA.Value -(QRomaneioQT_PESO_BRUTO.Value - QRomaneioQT_TARA.Value)));
     wCont := wCont + 3;

     Imp.WriteXY(8,Wcont,QRomaneioCOD_USUARIO.Text + ' - ');
     wAux := DMOracle.Buscanome('SELECT NOME FROM TB_USUARIO','COD_USUARIO ='+QRomaneioCOD_USUARIO.Text);
     Imp.WriteXY(9,Wcont,wAux );
     inc(wCont);
     Imp.WriteXY(9,Wcont,'BALANCEIRO');
     inc(wCont);
     Imp.WriteXY(1,Wcont,'-----------------------------------------------------------------------------------------------');
     Imp.SaltaPagina;
     Imp.FechaImpressora;
   end;
end;

procedure TFPesagemCad.DBEdit5Exit(Sender: TObject);
begin
  inherited;
  DMOracle.ValidaFilial(DBEdit5.Text);
end;

procedure TFPesagemCad.calculaDiferencaPeso;
var
  iPesoBalanca, iPesoCarga: Double;
begin
  if (Trim(MePesoBalanca.Text) <> '')
    and (Trim(DBEdit57.Text) <> '') then
  begin
    iPesoBalanca := StrToFloat(MePesoBalanca.Text);
    iPesoCarga := StrToFloat(DBEdit57.Text);

    iPesoBalanca := iPesoCarga - iPesoBalanca;
    edtDifBalanca.Text := FloatToStr(iPesoBalanca);
  end
  else
    edtDifBalanca.Text := '';
end;

procedure TFPesagemCad.buscaEmailCadastro;
begin
  if (Trim(DbEdit6.Text) <> '') and (DSPrimario.DataSet.State <> dsInsert)   then
    edtEmailCadastro.Text := DMOracle.FastSelect('DESC_E_MAIL', 'TB_CADASTRO', 'COD_CADASTRO = ' + DBEdit6.Text)
  else
    edtEmailCadastro.Text := '';

end;

procedure TFPesagemCad.EmitirPesagem1Click(Sender: TObject);
begin
  inherited;
  with DMRomaneioAgricola do
  begin
    DmUsuario.Checar_Filial_Usuario(Trim(QRomaneioCod_Filial.Text),'AGRICOLA');
    QRRomEmissao.Close;
    If QRomaneioCod_Romaneio_Agricola.Value = 0 then
       raise exception.create('Deve ser Informado Codigo Romaneio')
    Else
     Begin
       QRRomEmissao.SetVariable('ROMANEIO',QRomaneioCod_Romaneio_Agricola.Value);
       QRRomEmissao.SetVariable('COD_CADASTRO',Null);
       QRRomEmissao.SetVariable('DT_INICIAL',QRomaneioDt_Emissao.Value);
       QRRomEmissao.SetVariable('DT_FINAL',QRomaneioDt_Emissao.Value);
       QRRomEmissao.SetVariable('NUM_ROMANEIO_INICIAL',QRomaneioNum_Romaneio.Value);
       QRRomEmissao.SetVariable('NUM_ROMANEIO_FINAL',QRomaneioNum_Romaneio.Value);
       QRRomEmissao.SetVariable('COD_FILIAL',QRomaneioCod_Filial.Value);
       QRRomEmissao.SetVariable('TIPO_ROMANEIO',QRomaneioInd_Tipo_Romaneio.Value);
     End;
    QRRomEmissao.Open;
    QRRomEmissao.First;

    DMFilial.QFilial.Close;
    DMFilial.QFilial.SetVariable('PK', QRomaneioCod_Filial.Text);
    DMFilial.QFilial.Open;

    While not(QRRomEmissao.Eof) do
    Begin
      FRomaneioImpressao.EmitePesagem;
      QRRomEmissao.Next;
    End;
    QRRomEmissao.Close;
  End;  

end;

end.
