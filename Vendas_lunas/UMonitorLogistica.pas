unit UMonitorLogistica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Mask, Buttons, CheckLst, ExtCtrls, DBCtrls,
  Menus, variants;

type
  TFMonitorLogistica = class(TForm)
    BTAtualizaPedidos: TBitBtn;
    Label2: TLabel;
    CLBPedidosAberto: TCheckListBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    CLBSimulador: TCheckListBox;
    SBExcluir: TSpeedButton;
    SBIncluir: TSpeedButton;
    LBTotal: TLabel;
    LBVolume: TLabel;
    LBPeso: TLabel;
    LBCaixas: TLabel;
    LBCaixasM1: TLabel;
    LBPesoM1: TLabel;
    LBVolumeM1: TLabel;
    LBTotalM1: TLabel;
    LBCaixasPE: TLabel;
    LBPesoPE: TLabel;
    LBVolumePE: TLabel;
    LBTotalPE: TLabel;
    Bevel1: TBevel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    LBPesoCA: TLabel;
    LBVolumeCA: TLabel;
    LBPesoDF: TLabel;
    LBVolumeDF: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    MEVendedor: TMaskEdit;
    Label19: TLabel;
    SBVendedor: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SBFinalizar: TSpeedButton;
    CLBEstoque: TCheckListBox;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    SpeedButton2: TSpeedButton;
    MeFilial: TMaskEdit;
    MainMenu1: TMainMenu;
    Relatrios1: TMenuItem;
    PedidosporVendedor1: TMenuItem;
    SbTodos: TSpeedButton;
    BTLimpaPedidos: TBitBtn;
    Label6: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton5: TSpeedButton;
    N1: TMenuItem;
    PedidosdoEmbarque1: TMenuItem;
    Label26: TLabel;
    Label27: TLabel;
    Label1: TLabel;
    Menome: TMaskEdit;
    MeNome1: TMaskEdit;
    Label28: TLabel;
    SbEstado: TSpeedButton;
    MeEstado: TMaskEdit;
    Label29: TLabel;
    MeDtEntrega: TMaskEdit;
    PedidosporVendedorEstado1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure BTAtualizaPedidosClick(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure SBVendedorClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SBFinalizarClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure PedidosporVendedor1Click(Sender: TObject);
    procedure SbTodosClick(Sender: TObject);
    procedure BTLimpaPedidosClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure PedidosdoEmbarque1Click(Sender: TObject);
    procedure CLBPedidosAbertoClick(Sender: TObject);
    procedure CLBSimuladorClick(Sender: TObject);
    procedure SbEstadoClick(Sender: TObject);
    procedure PedidosporVendedorEstado1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    wEstoque: array[0..799,0..2] of real;
  end;

var
  FMonitorLogistica: TFMonitorLogistica;

implementation

uses UEmbarque_cl, UBiblioteca, UOracle_cl, UVendedorCons, UVendedor_cl,
  UFilialCons, UFilial_cl, UEmbarqueParam, URPedido_Vendedor,
  URPedidosEmbarque, UEstadoCons, UEstado_cl, URegiaoCons, URegiao_cl, URPedido_Vendedor_Estado;

{$R *.DFM}

//---procedimento de calculo e apresentacao dos totais de peso,volume
//--caixas e valor // - executado quando um pedido é inserido ou excluido do
//--- Componente lista do simulador CLBSimulador

procedure CalculoSimulador();
var
  wTotal_caixas,wTotal_Peso,wTotal_Volume,wTotal_Valor:real;
  wTotal_caixasM1,wTotal_PesoM1,wTotal_VolumeM1,wTotal_ValorM1:real;
  wTotal_caixasPE,wTotal_PesoPE,wTotal_VolumePE,wTotal_ValorPE:real;
  wTexto,wSql,wFiscal:String;
  I:integer;
begin
  //--inicializa variaveis de calculo total geral
  wTotal_caixas:=0;
  wTotal_Peso:=0;
  wTotal_Volume:=0;
  wTotal_Valor:=0;
  //--inicializa variaveis de calculo total M1
  wTotal_caixasM1:=0;
  wTotal_PesoM1:=0;
  wTotal_VolumeM1:=0;
  wTotal_ValorM1:=0;
  //--inicializa variaveis de calculo total PE
  wTotal_caixasPE:=0;
  wTotal_PesoPE:=0;
  wTotal_VolumePE:=0;
  wTotal_ValorPE:=0;

  with FMonitorLogistica do
  begin
    for I:= CLBSimulador.Items.Count-1 downto 0 do
    begin
      wTexto:=CLBSimulador.Items.Strings[I];//variavel texto recebe o conteudo da linha selecionada no Combo List
      wSql:='SELECT IND_EMITE FROM TB_PEDIDO_CAB, TB_OPERACAO';
      //----identifica se o pedido é fiscal ou nao
      wFiscal:= DMOracle.BuscaNome(wSql,' TB_PEDIDO_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO '+
                                        'AND TB_PEDIDO_CAB.COD_PEDIDO_CAB = '+Trim(copy(wTexto,39,10)));
      If wFiscal = 'F' then
       begin
        wTotal_caixasM1:=wTotal_caixasM1+StrToFloat(copy(wTexto,66,4));
        wTotal_PesoM1:=wTotal_PesoM1+StrToFloat(Bib.LimpaString(Copy(wTexto,70,13),'.'));
        wTotal_VolumeM1:=wTotal_VolumeM1+StrToFloat(Bib.LimpaString(copy(wTexto,83,13),'.'));
        wTotal_ValorM1:=wTotal_ValorM1+StrToFloat(Bib.LimpaString(copy(wTexto,96,15),'.'));
       end
      Else
       begin
        wTotal_caixasPE:=wTotal_caixasPE+StrToFloat(copy(wTexto,66,4));
        wTotal_PesoPE:=wTotal_PesoPE+StrToFloat(Bib.LimpaString(Copy(wTexto,70,13),'.'));
        wTotal_VolumePE:=wTotal_VolumePE+StrToFloat(Bib.LimpaString(copy(wTexto,83,13),'.'));
        wTotal_ValorPE:=wTotal_ValorPE+StrToFloat(Bib.LimpaString(copy(wTexto,96,15),'.'));
       end;
      //----recebe todos os valores---total geral
      wTotal_caixas:=wTotal_caixas+StrToFloat(copy(wTexto,66,4));
      wTotal_Peso:=wTotal_Peso+StrToFloat(Bib.LimpaString(Copy(wTexto,70,13),'.'));
      wTotal_Volume:=wTotal_Volume+StrToFloat(Bib.LimpaString(copy(wTexto,83,13),'.'));
      wTotal_Valor:=wTotal_Valor+StrToFloat(Bib.LimpaString(copy(wTexto,96,15),'.'));
    end;


    //---transfere conteudo das variaveis para os labels da tela
    LBCaixasM1.Caption:=FloatToStr(wTotal_CaixasM1);
    LBPesoM1.Caption:=FloatToStr(wTotal_PesoM1);
    LBVolumeM1.Caption:=FloatToStr(wTotal_VolumeM1);
    LBTotalM1.Caption:=FloatToStr(wTotal_ValorM1);

    LBCaixasPE.Caption:=FloatToStr(wTotal_CaixasPE);
    LBPesoPE.Caption:=FloatToStr(wTotal_PesoPE);
    LBVolumePE.Caption:=FloatToStr(wTotal_VolumePE);
    LBTotalPE.Caption:=FloatToStr(wTotal_ValorPE);

    LBCaixas.Caption:=FloatToStr(wTotal_Caixas);
    LBPeso.Caption:=FloatToStr(wTotal_Peso);
    LBVolume.Caption:=FloatToStr(wTotal_Volume);
    LBTotal.Caption:=FloatToStr(wTotal_Valor);
  end;
end;

procedure inicializaVetor();
var
  i:Integer;
begin
  with FMonitorLogistica do
  begin
    for i:= 0 to 799 do
    begin
      wEstoque[i][0]:=0;
      wEstoque[i][1]:=0;
      wEstoque[i][2]:=0;
    end;
  end;
end;

procedure addVetor(cod_filial :real;cod_produto:real;qt_pedido:real);
var
  x,wAux,i:Integer;
//  wFilial,wProduto:real;
begin
  //--------descobre ult. pos. do vet.
  x:=0;
  with FMonitorLogistica do
  begin
    while not(wEstoque[x][0] = 0) and(x<799) do
    begin
      inc(x);
    end;

    wAux:=0; //-- flag q indica se o produto já existe no vetor
    for i:=0 to x-1 do
    begin
      if (wEstoque[i][0] = cod_filial) and (wEstoque[i][1] = cod_produto) then
      begin
        wEstoque[i][2]:=wEstoque[i][2]+qt_pedido;
        wAux:=1;
      end;
    end;
    
    //----grava no final do vetor
    if wAux = 0 then
    begin
      wEstoque[x][0] := cod_filial;
      wEstoque[x][1] := cod_produto;
      wEstoque[x][2] := qt_pedido;
    end;

  end;
end;

//--------------------------------------------------------------------------------------
procedure validaEstoque();
var
  I,x:integer;
  wTexto:string;
  wQt_Simulador,wQt_Estoque:real;
begin
 inicializaVetor();
  with FMonitorLogistica do
  begin
    with DMEmbarque do
    begin
      //----monta o vetor
      for I:= CLBSimulador.Items.Count-1 downto 0 do
      begin
        wTexto:=CLBSimulador.Items.Strings[I];
        QSimuladorEstoque.Close;
        QSimuladorEstoque.setVariable('cod_pedido_cab',trim(copy(wTexto,39,10)));
        QSimuladorEstoque.Open;
        QSimuladorEstoque.first;

        while not QSimuladorEstoque.eof do
        begin
          addVetor(QSimuladorEstoqueCod_Filial.Value,QSimuladorEstoqueCod_Produto.Value,QSimuladorEstoqueQt_Pedido.Value);
          QSimuladorEstoque.next;
        end;
      end;
    end;
    x:=0;
    while not(wEstoque[x][0] = 0) and(x<799) do
    begin
      CLBEstoque.Items.add(FloatToStr(wEstoque[x][0])+' - '+FloatToStr(wEstoque[x][1])+' - '+FloatToStr(wEstoque[x][2])+' - '+
      (DMOracle.BuscaNome('SELECT QT_QUANTIDADE FROM TB_ESTOQUE','COD_FILIAL = '+FloatToStr(wEstoque[x][0])+' AND COD_PRODUTO = '+FloatToStr(wEstoque[x][1]))));
      inc(x);
    end;

    x:=0;
    while not(wEstoque[x][0] = 0) and(x<799) do
    begin
      wQt_Simulador:=wEstoque[x][2];
      if DMOracle.BuscaNome('SELECT QT_QUANTIDADE FROM TB_ESTOQUE','COD_FILIAL = '+FloatToStr(wEstoque[x][0])+' AND COD_PRODUTO = '+FloatToStr(wEstoque[x][1]))<>''then
        wQt_Estoque:=StrToFloat(DMOracle.BuscaNome('SELECT QT_QUANTIDADE FROM TB_ESTOQUE','COD_FILIAL = '+FloatToStr(wEstoque[x][0])+' AND COD_PRODUTO = '+FloatToStr(wEstoque[x][1])));
      if (wQt_Simulador > wQt_Estoque) then
        showmessage('Estoque insuficiente para o o produto: '+FloatToStr(wEstoque[x][1])+' Estoque Vai Ficar :'+FloatToStr(wQt_Simulador - wQt_Estoque));
      inc(x);
    end;
  end;
end;


//--------------------------------------------------------------------------------------


procedure TFMonitorLogistica.FormActivate(Sender: TObject);
begin
  DMEmbarque.QListaCaminhoes.Open;
end;

procedure TFMonitorLogistica.BTAtualizaPedidosClick(Sender: TObject);
var
  wTexto,wTipo:String;
begin
  wTexto:='';//---inicializa variavel que monta os itens da lista de ped. aberto

  with DMEmbarque do
  begin
  {  for I:= CLBPedidosAberto.Items.Count-1 downto 0 do
    begin
      CLBPedidosAberto.Items.Delete(I);
    end;
  } //---------comentado por Fabio 05/11/2004 -- para acumular resultados de consultas dos representantes

    QPedidoAberto.Close;
//  QPedidoAberto.setVariable('DATA_I',StrToDate(MEDtEmissao.Text));
    if Trim(MEFilial.Text) <> '' then
      QPedidoAberto.setVariable('COD_FILIAL',StrToInt(Trim(MEFilial.Text)))
    else
      QPedidoAberto.setVariable('COD_FILIAL',Null);
    if Trim(MEVendedor.Text) <> '' then
      QPedidoAberto.setVariable('COD_VENDEDOR',StrToInt(Trim(MEVendedor.Text)))
    else
      QPedidoAberto.setVariable('COD_VENDEDOR',Null);
    if Trim(MeEstado.Text) <> '' then
      QPedidoAberto.setVariable('COD_ESTADO',Trim(MeEstado.Text))
    else
      QPedidoAberto.setVariable('COD_ESTADO',Null);
    QPedidoAberto.setVariable('DT_ENTREGA',StrToDate(MeDtEntrega.Text));
    QPedidoAberto.Open;
    QPedidoAberto.first;
    while not(QPedidoAberto.eof) do
    begin
      wTexto:='';
      If 'F' = DMOracle.BuscaNome('SELECT IND_EMITE FROM TB_OPERACAO',
                            'COD_OPERACAO = '+FloatToStr(QPedidoAbertoCod_Operacao.Value) ) Then
         wTipo := 'NF'
      Else
         wTipo := 'PD';
      if QPedidoAbertoDT_CANCELAMENTO.Text <> '' then
        wTexto:='?'
      else
        wTexto:=' ';
      wTexto:=wTexto+
      Bib.FormataTexto(Trim(QPedidoAbertoCod_Vendedor.text),4)+
      Bib.FormataTexto(Trim(QPedidoAbertoDesc_Regiao.text)+'-'+Trim(QPedidoAbertoDesc_Bairro.text),33)+' '+
      Bib.FormataTexto(Trim(QPedidoAbertoCod_Pedido_Cab.text),9)+
      Bib.FormataTexto(Trim(QPedidoAbertoCod_Cadastro.Text),7) +
      Bib.FormataTexto(Trim(QPedidoAbertoDt_Emissao.Text),10)+
      Bib.FormataTextoEsq(Trim(QPedidoAbertoTotal_Caixas.text),4)+
      Bib.FormataTextoEsq(Trim(QPedidoAbertoPeso.Text),13)+
      Bib.FormataTextoEsq(Trim(QPedidoAbertoVolume.Text),13)+
      Bib.FormataTextoEsq(Trim(QPedidoAbertoVal_total.Text),15)+
      Bib.FormataTexto('  '+Trim(QPedidoAbertoDesc_Observacao.Text),25) + wTipo +'-'+Trim(QPedidoAbertoNome.Text);
      CLBPedidosAberto.Items.add(wTexto);
      QPedidoAberto.next;
    end;

  end;
end;

procedure TFMonitorLogistica.SBIncluirClick(Sender: TObject);
//var wTotal_caixas,wTotal_Peso,wTotal_Volume,wTotal_Valor:real;
//    wTexto:String;
var
  I:integer;
begin
  for I:= CLBPedidosAberto.Items.Count-1 downto 0 do
  begin
    if CLBPedidosAberto.Checked[I] then
    begin
      CLBSimulador.Items.Add(CLBPedidosAberto.Items.Strings[I]);
      CLBPedidosAberto.Items.Delete(I);
      CalculoSimulador();
      FMonitorLogistica.DBLookupComboBox1Click(self);
    end;
  end;
end;

procedure TFMonitorLogistica.SBExcluirClick(Sender: TObject);
var
  I:integer;
begin
  for I:= CLBSimulador.Items.Count-1 downto 0 do
  begin
    if CLBSimulador.Checked[I] then
    begin
      CLBPedidosAberto.Items.Add(CLBSimulador.Items.Strings[I]);
      CLBSimulador.Items.Delete(I);
      CalculoSimulador();
      FMonitorLogistica.DBLookupComboBox1Click(self);
    end;
  end;
end;

procedure TFMonitorLogistica.DBLookupComboBox1Click(Sender: TObject);
var
  wPeso,wVolume:String;
begin
  wPeso:='';
  wVolume:='';

  wPeso:=DMOracle.BuscaNome('SELECT VAL_MAX_CARGA FROM TB_VEICULO_CONHECIMENTO',
                                       'DESC_PLACA = '+Chr(39)+DBLookupComboBox1.Text+Chr(39));
  wVolume:=DMOracle.BuscaNome('SELECT VAL_VOLUME FROM TB_VEICULO_CONHECIMENTO',
                                         'DESC_PLACA = '+Chr(39)+DBLookupComboBox1.Text+Chr(39));
  if wPeso <> '' then
    LBPesoCA.Caption:=wPeso
  else
    LBPesoCA.Caption:='0';

  if wVolume <> '' then
    LBVolumeCA.Caption:=wVolume
  else
    LBVolumeCA.Caption:='0';

  //---calculo da diferenca da carga e o caminhao
  LBPesoDF.Caption:=FloatToStr(StrToFloat(LBPesoCA.Caption)-StrToFloat(LBPeso.Caption));
  LBVolumeDF.Caption:=FloatToStr(StrToFloat(LBVolumeCA.Caption)-StrToFloat(LBVolume.Caption));

  //---altera cor da fonte quando volume ou peso maximos atingidos
  if StrToFloat(LBPesoDF.Caption) > 0 then
    LBPesoDF.font.Color:=clBlue
  else
    LBPesoDF.font.Color:=clRed;
  if StrToFloat(LBVolumeDF.Caption) > 0 then
    LBVolumeDF.font.Color:=clBlue
  else
    LBVolumeDF.font.Color:=clRed;


end;

procedure TFMonitorLogistica.SBVendedorClick(Sender: TObject);
begin
  if FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
    MEVendedor.Text:=DMVendedor.QVendedorConsCod_Vendedor.Text;
end;

procedure TFMonitorLogistica.SpeedButton4Click(Sender: TObject);
begin
  BTAtualizaPedidos.Enabled:=False;
  BTLimpaPedidos.Enabled:=False;
  SBIncluir.Enabled:=True;
  SBExcluir.Enabled:=True;
  SBtodos.Enabled:=True;
  SBFinalizar.Enabled:=true;
end;

procedure TFMonitorLogistica.SBFinalizarClick(Sender: TObject);
var I:Integer;
begin
  BTAtualizaPedidos.Enabled:=True;
  BTLimpaPedidos.Enabled:=True;
  SBIncluir.Enabled:=False;
  SBExcluir.Enabled:=False;
  SBtodos.Enabled:=False;

  //---limpa list dos pedidos abertos
  For I:= CLBPedidosAberto.Items.Count-1 downto 0 do
    CLBPedidosAberto.Items.Delete(I);

  //---limpa list da simulacao
  For I:= CLBSimulador.Items.Count-1 downto 0 do
    CLBSimulador.Items.Delete(I);

end;

procedure TFMonitorLogistica.SpeedButton3Click(Sender: TObject);
var
  I:Integer;
  wTexto:String;
//  wCod_Pedido_Cab: array[0..290] of String;
  wCod_Embarque : integer;
begin
  BTAtualizaPedidos.Enabled:=True;
  SBIncluir.Enabled:=False;
  SBExcluir.Enabled:=False;
  SBtodos.Enabled:=False;
  try
    DMOracle.DBCemapa.StartTransaction;

    ValidaEstoque(); //---verifica se existe estoque suficiente

    //---gera embarque cab
    wCod_Embarque := DMEmbarque.OPEmbarque.CallIntegerFunction(
          'GERA_EMBARQUE',[]);
    //---gera embarque item
    for I:= CLBSimulador.Items.Count-1 downto 0 do
    begin
      wTexto:=CLBSimulador.Items.Strings[I];
     DMEmbarque.OPEmbarque.CallProcedure(
          'GERA_EMBARQUE_ITEM',[wCod_Embarque,StrToInt(Trim(copy(wTexto,39,10))),I+1]);
     //---ALTERA SITUACAO DO PEDIDO PARA 2 = EMBARCADO
     DMEmbarque.OPEmbarque.CallProcedure(
          'SITUACAO_PEDIDO',['S',StrToInt(trim(copy(wTexto,39,10)))]);
   end;

   //---limpa list da simulacao
  for I:= CLBSimulador.Items.Count-1 downto 0 do
    CLBSimulador.Items.Delete(I);

   DMOracle.DBCemapa.Commit;
   showmessage('Embarque Nº '+IntToStr(wCod_Embarque)+' criado com Sucesso!');
  except
    raise;
    DMOracle.DBCemapa.Rollback;
    showmessage('Embarque não Pode ser Gerado');
  end;
end;

procedure TFMonitorLogistica.SpeedButton2Click(Sender: TObject);
begin
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    MeFilial.Text:=DMFilial.QFilialConsCod_Filial.Text;

end;

procedure TFMonitorLogistica.PedidosporVendedor1Click(Sender: TObject);
begin
  if FEmbarqueParam = nil then
    FEmbarqueParam:= TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[11].TabVisible := True;
  If FEmbarqueParam.ShowModal = mrOk then
  begin
    With DMEmbarque do
    begin
      QRPedido_Vendedor.Close;

      If(Trim(FEmbarqueParam.ME10Filial.Text) <> '')Then
        QRPedido_Vendedor.setVariable('COD_FILIAL',trim(FEmbarqueParam.ME10Filial.Text))
      Else
        QRPedido_Vendedor.setVariable('COD_FILIAL',null);

      If(Trim(FEmbarqueParam.ME10Vendedor.Text) <> '')Then
        QRPedido_Vendedor.setVariable('COD_VENDEDOR',trim(FEmbarqueParam.ME10Vendedor.text))
      Else
        QRPedido_Vendedor.setVariable('COD_VENDEDOR',null);

      If(Trim(FEmbarqueParam.ME10Supervisor.Text) <> '')Then
        QRPedido_Vendedor.setVariable('COD_SUPERVISOR',trim(FEmbarqueParam.ME10Supervisor.text))
      Else
        QRPedido_Vendedor.setVariable('COD_SUPERVISOR',null);

      if(Trim(FEmbarqueParam.Me10Regiao.Text) <> '') then
        QRPedido_Vendedor.SetVariable('COD_REGIAO',Trim(FEmbarqueParam.Me10Regiao.Text))
      else
        QRPedido_Vendedor.SetVariable('COD_REGIAO',null);

      QrPedido_Vendedor.open;

      If FRPedido_Vendedor = Nil Then
         FRPedido_Vendedor := TFRPedido_Vendedor.Create(Application);
   //   FRPedido_Vendedor.QRLVendedor.Caption := 'Vendedor: ' + FEmbarqueParam.ME10Vendedor.text + ' '+ FEmbarqueParam.Ed10Vendedor.Text;
      FRPedido_Vendedor.QRLFilial.Caption := 'Filial: ' + FEmbarqueParam.ME10Filial.text + ' '+ FEmbarqueParam.Ed10Filial.Text;

      if FEmbarqueParam.RG10Supervisor.ItemIndex = 0 then
        FRPedido_Vendedor.setMostraSupervisor(true);
      if FEmbarqueParam.RG10Supervisor.ItemIndex = 1 then
        FRPedido_Vendedor.setMostraSupervisor(false);

      If FEmbarqueParam.RGPreview.ItemIndex = 0 then
        FRPedido_Vendedor.QRPrimario.Preview
      Else
        FRPedido_Vendedor.QRPrimario.Print;

    End;
  End;
End;

procedure TFMonitorLogistica.SbTodosClick(Sender: TObject);
//var wTotal_caixas,wTotal_Peso,wTotal_Volume,wTotal_Valor:real;
//    wTexto:String;
var   I:integer;
begin
  for I:= CLBPedidosAberto.Items.Count-1 downto 0 do
  begin
    CLBSimulador.Items.Add(CLBPedidosAberto.Items.Strings[I]);
    CLBPedidosAberto.Items.Delete(I);
    CalculoSimulador();
    FMonitorLogistica.DBLookupComboBox1Click(self);
  end;
end;

procedure TFMonitorLogistica.BTLimpaPedidosClick(Sender: TObject);
var
  I:Integer;
begin
    for I:= CLBPedidosAberto.Items.Count-1 downto 0 do
    begin
      CLBPedidosAberto.Items.Delete(I);
    end;
end;

procedure TFMonitorLogistica.SpeedButton5Click(Sender: TObject);
var i,j : integer;
    c : boolean;
begin
  j := CLBSimulador.Items.Count;
  i := CLBSimulador.ItemIndex;
  c := CLBSimulador.Checked[i];
  if (i>0) and (i < j) then
  begin
    CLBSimulador.Items.move(i,i-1);
    CLBSimulador.ItemIndex := i-1;
    CLBSimulador.Checked[i-1] := c;
  end;
end;

procedure TFMonitorLogistica.SpeedButton1Click(Sender: TObject);
var i,j : integer;
    c : boolean;
begin
  j := CLBSimulador.Items.Count;
  i := CLBSimulador.ItemIndex;
  c := CLBSimulador.Checked[i];
  if (i>= 0) and (i < j-1) then
  begin
    CLBSimulador.Items.move(i,i+1);
    CLBSimulador.ItemIndex := i+1;
    CLBSimulador.Checked[i+1] := c;
  end;
end;

procedure TFMonitorLogistica.PedidosdoEmbarque1Click(Sender: TObject);
begin
  if FEmbarqueParam = nil then
    FEmbarqueParam:= TFEmbarqueParam.Create(Application);
    FEmbarqueParam.PGRelatorio.Pages[12].TabVisible := True;
  If FEmbarqueParam.ShowModal = mrOk then
  begin
    With DMEmbarque do
    begin
      QRPedidoEmbarque.Close;
      If(Trim(FEmbarqueParam.ME13Embarque.Text) = '')Then
        raise exception.create('Informe um Número de Embarque');

      QRPedidoEmbarque.setVariable('EMBARQUE',Trim(FEmbarqueParam.ME13Embarque.Text));
      QRPedidoEmbarque.Open;

      If FRPedidoEmbarque = Nil Then
         FRPedidoEmbarque := TFRPedidoEmbarque.Create(Application);
      If FEmbarqueParam.RGPreview.ItemIndex = 0 then
        FRPedidoEmbarque.QRPrimario.Preview
      Else
        FRPedidoEmbarque.QRPrimario.Print;
      QRPedidoEmbarque.Close;
    End;
  End;
end;

procedure TFMonitorLogistica.CLBPedidosAbertoClick(Sender: TObject);
begin
  MeNome.Text := Copy(CLBPedidosAberto.Items.Strings[CLBPedidosAberto.ItemIndex],139,20)
end;

procedure TFMonitorLogistica.CLBSimuladorClick(Sender: TObject);
begin
  MeNome1.Text := Copy(CLBSimulador.Items.Strings[CLBSimulador.ItemIndex],139,20)
end;

procedure TFMonitorLogistica.SbEstadoClick(Sender: TObject);
begin
  if FEstadoCons = Nil then
    FEstadoCons := TFEstadoCons.Create(Application);
  if FEstadoCons.ShowModal = mrOk then
    MeEstado.Text:=DMEstado.QEstadoConsCod_Estado.Text;

end;

procedure TFMonitorLogistica.PedidosporVendedorEstado1Click(
  Sender: TObject);
begin
  if FEmbarqueParam = nil then
    FEmbarqueParam:= TFEmbarqueParam.Create(Application);
    FEmbarqueParam.PGRelatorio.Pages[19].TabVisible := True;
  If FEmbarqueParam.ShowModal = mrOk then
  begin
    with DMEmbarque do
    begin
      QRPedido_Vendedor_Estado.Close;

      if Trim(FEmbarqueParam.Me20CodFilial.Text) <> '' then
        QRPedido_Vendedor_Estado.SetVariable('COD_FILIAL', Trim(FEmbarqueParam.Me20CodFilial.Text))
      else
        QRPedido_Vendedor_Estado.SetVariable('COD_FILIAL', null);

      if Trim(FEmbarqueParam.Me20CodVendedor.Text) <> '' then
        QRPedido_Vendedor_Estado.SetVariable('COD_VENDEDOR', Trim(FEmbarqueParam.Me20CodVendedor.Text))
      else
        QRPedido_Vendedor_Estado.SetVariable('COD_VENDEDOR', null);

      if Trim(FEmbarqueParam.Me20CodSupervisor.Text) <> '' then
        QRPedido_Vendedor_Estado.SetVariable('COD_SUPERVISOR', Trim(FEmbarqueParam.Me20CodSupervisor.Text))
      else
        QRPedido_Vendedor_Estado.SetVariable('COD_SUPERVISOR', null);
      if Trim(FEmbarqueParam.Me20Estado.Text) <> '' then
        QRPedido_Vendedor_Estado.SetVariable('COD_ESTADO', Trim(FEmbarqueParam.Me20Estado.Text))
      else
        QRPedido_Vendedor_Estado.SetVariable('COD_ESTADO', null);

      QRPedido_Vendedor_Estado.Open;

      if FRPedido_Vendedor_Estado = Nil then
        FRPedido_Vendedor_Estado := TFRPedido_Vendedor_Estado.Create(Application);
      FRPedido_Vendedor_Estado.QRLFilial.Caption :='Filial:' + Trim(FEmbarqueParam.Ed20DescFilial.Text);
      if FEmbarqueParam.RGPreview.ItemIndex = 0 then
        FRPedido_Vendedor_Estado.QRPrimario.Preview
      else
        FRPedido_Vendedor_Estado.QRPrimario.Print;
      QRPedido_Vendedor_Estado.Close;
    end;
  end;
end;

end.
