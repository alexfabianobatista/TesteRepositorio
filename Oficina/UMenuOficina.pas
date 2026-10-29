unit UMenuOficina;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTMENUPRINCIPAL, Menus, Buttons, ExtCtrls, StdCtrls, db, variants,
  ImgList, ComCtrls;

type
  TFMenuOficina = class(TFTMenuPrincipal)
    Manuteno1: TMenuItem;
    Mecanicos1: TMenuItem;
    Veculos1: TMenuItem;
    Modelos1: TMenuItem;
    N2: TMenuItem;
    OServio1: TMenuItem;
    TiposdeOS1: TMenuItem;
    N3: TMenuItem;
    FechamentoOS1: TMenuItem;
    Requisio1: TMenuItem;
    ServiosTerceiros1: TMenuItem;
    Relatrios1: TMenuItem;
    CadastrodeTIPOSDEOS1: TMenuItem;
    Serviosdeterceiros1: TMenuItem;
    OSPendente1: TMenuItem;
    OSporcusto1: TMenuItem;
    N1: TMenuItem;
    OramentoOficina1: TMenuItem;
    Mapadevendasoficina1: TMenuItem;
    AtualizaEstoqueCusto1: TMenuItem;
    Vendasliquidas1: TMenuItem;
    Produtoscomcustozero01: TMenuItem;
    N4: TMenuItem;
    EtiquetaCdigobarraNF1: TMenuItem;
    N5: TMenuItem;
    Iniciarmarcao1: TMenuItem;
    Finalizarmarcao1: TMenuItem;
    Vendasavistabalco1: TMenuItem;
    N6: TMenuItem;
    RelInvetrioPeas1: TMenuItem;
    ImpFormulrioContagem1: TMenuItem;
    ReldePeasOEMemEstoque1: TMenuItem;
    RelAcertosdeEstoque1: TMenuItem;
    N7: TMenuItem;
    OrdemServio1: TMenuItem;
    Oramento1: TMenuItem;
    RelQtdedePeasComOSAberta1: TMenuItem;
    Requisio2: TMenuItem;
    procedure Mecanicos1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Veculos1Click(Sender: TObject);
    procedure Modelos1Click(Sender: TObject);
    procedure OServio1Click(Sender: TObject);
    procedure TiposdeOS1Click(Sender: TObject);
    procedure TabeladeCondPgto1Click(Sender: TObject);
    procedure FechamentoOS1Click(Sender: TObject);
    procedure Requisio1Click(Sender: TObject);
    procedure ServiosTerceiros1Click(Sender: TObject);
    procedure CadastrodeTIPOSDEOS1Click(Sender: TObject);
    procedure Serviosdeterceiros1Click(Sender: TObject);
    procedure OSPendente1Click(Sender: TObject);
    procedure OSporcusto1Click(Sender: TObject);
    procedure OramentoOficina1Click(Sender: TObject);
    procedure Mapadevendasoficina1Click(Sender: TObject);
    procedure AtualizaEstoqueCusto1Click(Sender: TObject);
    procedure Vendasliquidas1Click(Sender: TObject);
    procedure Produtoscomcustozero01Click(Sender: TObject);
    procedure EtiquetaCdigobarraNF1Click(Sender: TObject);
    procedure Iniciarmarcao1Click(Sender: TObject);
    procedure Finalizarmarcao1Click(Sender: TObject);
    procedure Vendasavistabalco1Click(Sender: TObject);
    procedure RelInvetrioPeas1Click(Sender: TObject);
    procedure ReldePeasOEMemEstoque1Click(Sender: TObject);
    procedure ImpFormulrioContagem1Click(Sender: TObject);
    procedure RelAcertosdeEstoque1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure OrdemServio1Click(Sender: TObject);
    procedure Oramento1Click(Sender: TObject);
    procedure RelQtdedePeasComOSAberta1Click(Sender: TObject);
    procedure Requisio2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuOficina: TFMenuOficina;

implementation

uses UMecanicoCad, UTela_cl, UVeiculoCad, UVeiculoModeloCad, UOSCad,
  UOS_TipoCad, UCondicao_pgto, UOSFechamento, URequisicaoCad, UOSMarcacao,
  UServico, UServico_Terceiro, UROS_Tipo, UOficina_cl, UOficinaParam,
  URServico_Terceiro, URelatorio_cl, UROSPendente, UROSCustoItem,
  UBiblioteca, UProdutoSemCusto, UOrcamento_Oficina, UAtualizaEstoque_Custo,
  URMapaVenda_Oficina, UOracle_cl, UVendedor_cl,
  UREtiquetaCodBarraNF, UOficinaPassword,
  UMarcacaoFinaliza, URVendaAvistaBalcao, URPecasEstoque, URPecasOEMEstoque,
  URContagemPecas, URControleEstoque, UParamSistema_cl, UOficinaCad,
  UOficinaOrcamento, URVendasLiquidasPeriodo, URQtdePecasOSAbertas,
  URequisicaoCad2;

{$R *.DFM}

procedure TFMenuOficina.Mecanicos1Click(Sender: TObject);
begin
  inherited;
  if FOFI0001 = nil then
     FOFI0001 := TFOFI0001.Create(Application);
  DMTela.VerificaTela(pModulo,FOFI0001.Caption,FOFI0001.Name);
  FOFI0001.ShowModal;
end;

procedure TFMenuOficina.FormCreate(Sender: TObject);
begin
  inherited;
  FMenuOficina.pModulo := 'OFICINA';
end;

procedure TFMenuOficina.Veculos1Click(Sender: TObject);
begin
  inherited;
  if FOFI0020 = Nil then
    FOFI0020 := TFOFI0020.Create(Application);
  DMTela.VerificaTela(pModulo,FOFI0020.Caption,FOFI0020.Name);
  FOFI0020.ShowModal;
end;

procedure TFMenuOficina.Modelos1Click(Sender: TObject);
begin
  inherited;
  if FOFI0023 = Nil then
     FOFI0023 := TFOFI0023.Create(Application);
  DMTela.VerificaTela(pModulo,FOFI0023.Caption,FOFI0023.Name);
  FOFI0023.ShowModal;
end;

procedure TFMenuOficina.OServio1Click(Sender: TObject);
begin
  inherited;
  if FOFI0009 = nil then
     FOFI0009 := TFOFI0009.Create(Application);
  DMTela.VerificaTela(pModulo,FOFI0009.Caption,FOFI0009.Name);
  FOFI0009.ShowModal;
end;

procedure TFMenuOficina.TiposdeOS1Click(Sender: TObject);
begin
  inherited;
  if FOFI0007 = nil then
     FOFI0007 := TFOFI0007.Create(Application);
  DMTela.VerificaTela(pModulo,FOFI0007.Caption,FOFI0007.Name);
  FOFI0007.ShowModal;
end;

procedure TFMenuOficina.TabeladeCondPgto1Click(Sender: TObject);
begin
  inherited;
  if FCondicao_pgto=nil then
     FCondicao_pgto:= TFCondicao_pgto.Create(Application);
  DMTela.VerificaTela(pModulo,FCondicao_pgto.Caption,FCondicao_pgto.Name);
  FCondicao_pgto.ShowModal;
end;

procedure TFMenuOficina.FechamentoOS1Click(Sender: TObject);
begin
  inherited;
  if FOSFechamento = nil then
    FOSFechamento := TFOSFechamento.Create(Self);
  DMTela.VerificaTela(pModulo,FOSFechamento.Caption,FOSFechamento.Name);
  FOSFechamento.ShowModal;
end;

procedure TFMenuOficina.Requisio1Click(Sender: TObject);
begin
  inherited;
  if FOFI0011 = nil then
     FOFI0011:= TFOFI0011.Create(Application);
  DMTela.VerificaTela(pModulo,FOFI0011.Caption,FOFI0011.Name);
  FOFI0011.ShowModal;
end;

procedure TFMenuOficina.ServiosTerceiros1Click(Sender: TObject);
begin
  inherited;
  if FOFI0017 = nil then
     FOFI0017:= TFOFI0017.Create(Application);
  DMTela.VerificaTela(pModulo,FOFI0017.Caption,FOFI0017.Name);
  FOFI0017.ShowModal;
end;

procedure TFMenuOficina.CadastrodeTIPOSDEOS1Click(Sender: TObject);
begin
  inherited;
  if FROS_Tipo = nil then
     FROS_Tipo:= TFROS_Tipo.Create(Application);
  with DMOficina do
  begin
    QROS_Tipo.Close;
    QROS_Tipo.Open;
    FROS_Tipo.QRPrimario.Preview;
    QROS_Tipo.Close;
  end;
end;

procedure TFMenuOficina.Serviosdeterceiros1Click(Sender: TObject);
begin
  inherited;
  if FOficinaParam = nil then
     FOficinaParam:= TFOficinaParam.Create(Application);

  FOficinaParam.PGRelatorio.Pages[4].TabVisible := True;
  if FOficinaParam.ShowModal = mrOk then
     with DMOficina do
     begin
       if (Trim(FOficinaParam.MEDataServico_I.Text) = '') or (Trim(FOficinaParam.MEDataServico_F.Text) = '') then
          raise exception.Create('É necessario informar periodo!');

       QRServico_Terceiro.Close;
       if Trim(FOficinaParam.EdNumOS1.Text) = '' then
          QRServico_Terceiro.SetVariable('NUM_OS',NULL)
       else
          QRServico_Terceiro.SetVariable('NUM_OS',FOficinaParam.EdNumOS1.Text);

       if Trim(FOficinaParam.MECadastroCod2.Text) = '' then
          QRServico_Terceiro.SetVariable('COD_CADASTRO',NULL)
       else
          QRServico_Terceiro.SetVariable('COD_CADASTRO',FOficinaParam.MECadastroCod2.Text);

       if Trim(FOficinaParam.MEVendedorCod.Text) = '' then
          QRServico_Terceiro.SetVariable('COD_VENDEDOR',NULL)
       else
          QRServico_Terceiro.SetVariable('COD_VENDEDOR',FOficinaParam.MEVendedorCod.Text);

       if Trim(FOficinaParam.MEServicoCod.Text) = '' then
          QRServico_Terceiro.SetVariable('COD_SERVICO',NULL)
       else
          QRServico_Terceiro.SetVariable('COD_SERVICO',FOficinaParam.MEServicoCod.Text);

       QRServico_Terceiro.SetVariable('DT_SERVICO_I',FOficinaParam.MEDataServico_I.Text);
       QRServico_Terceiro.SetVariable('DT_SERVICO_F',FOficinaParam.MEDataServico_F.Text);

       QRServico_Terceiro.Open;

       if FRServico_Terceiro = nil then
          FRServico_Terceiro:= TFRServico_Terceiro.Create(Application);
       if FOficinaParam.RGPreview.ItemIndex = 0 then
          FRServico_Terceiro.QRPrimario.Preview
       else
          FRServico_Terceiro.QRPrimario.Print;

       QRServico_Terceiro.Close;
     end;
end;

procedure TFMenuOficina.OSPendente1Click(Sender: TObject);
begin
  inherited;
  if FOficinaParam = nil then
     FOficinaParam := TFOficinaParam.Create(Application);

  FOficinaParam.PGRelatorio.Pages[5].TabVisible := True;
  if FOficinaParam.ShowModal = mrOk then
  begin
    with DMOficina_Relatorio do
    begin
      QROSPendente.Close;

      if Trim(FOficinaParam.MECodFilial.Text) = '' then
         QROSPendente.SetVariable('COD_FILIAL',Null)
      else
         QROSPendente.SetVariable('COD_FILIAL',FOficinaParam.MECodFilial.Text);
      QROSPendente.Open;

      if FROSPendente = nil then
         FROSPendente:= TFROSPendente.Create(Application);
      if FOficinaParam.RGPreview.ItemIndex = 0 then
         FROSPendente.QRPrimario.Preview
      else
         FROSPendente.QRPrimario.Print;
    end;

    FROSPendente.Release;
    FROSPendente := Nil;

  end;
end;

procedure TFMenuOficina.OSporcusto1Click(Sender: TObject);
begin
  inherited;
  if FOficinaParam = nil then
     FOficinaParam := TFOficinaParam.Create(Application);

  FOficinaParam.PGRelatorio.Pages[6].TabVisible := True;
  if FOficinaParam.ShowModal = mrOk then
  begin
    if Trim(FOficinaParam.EdNumOS7.Text) = '' then
       raise exception.Create('Número da O.S. deve ser informado!');

    with DMOficina_Relatorio do
    begin
      QRRequisicao_custo.Close;
      QRRequisicao_custo.SetVariable('NUM_OS',FOficinaParam.EdNumOS7.Text);
      QRRequisicao_custo.Open;
      if FROSCustoItem = nil then
         FROSCustoItem:= TFROsCustoItem.Create(Application);
      if FOficinaParam.RGPreview.ItemIndex = 0 then
         FROSCustoItem.QRPrimario.Preview
      else
         FROSCustoItem.QRPrimario.Print;
      QRRequisicao_custo.Close;
    end;
  end;
end;

procedure TFMenuOficina.OramentoOficina1Click(Sender: TObject);
begin
  inherited;
  if FOFI0006 = nil then
     FOFI0006:= TFOFI0006.Create(Application);
  DMTela.VerificaTela(pModulo,FOFI0006.Caption,FOFI0006.Name);
  FOFI0006.ShowModal;
end;

procedure TFMenuOficina.Mapadevendasoficina1Click(Sender: TObject);
begin
  inherited;
  if FOficinaParam = nil then
     FOficinaParam := TFOficinaParam.Create(Application);

  FOficinaParam.PGRelatorio.Pages[7].TabVisible := True;
  if FOficinaParam.ShowModal = mrOk then
  begin
    if (Trim(FOficinaParam.MEDataI8.Text) = '') or
       (Trim(FOficinaParam.MEDataF8.Text) = '') then
       raise exception.Create('Periodo deve ser informado!');

    with DMOficina_Relatorio do
    begin
      QRMapaVendaOficina.Close;
      QRMapaVendaOficina.SetVariable('DT_EMISSAO_I',FOficinaParam.MEDataI8.Text);
      QRMapaVendaOficina.SetVariable('DT_EMISSAO_F',FOficinaParam.MEDataF8.Text);
      if Trim(FOficinaParam.MECodFilial8.Text) = '' then
         QRMapaVendaOficina.SetVariable('COD_FILIAL',Null)
      else
         QRMapaVendaOficina.SetVariable('COD_FILIAL',FOficinaParam.MECodFilial8.Text);
      QRMapaVendaOficina.Open;
      if FRMapaVendaOficina = nil then
         FRMapaVendaOficina:= TFRMapaVendaOficina.Create(Application);

      FRMapaVendaOficina.QRLTitulo.Caption:='MAPA DE VENDAS OFICINA-PERIODO DE '+
      FOficinaParam.MEDataI8.Text+' Até '+FOficinaParam.MEDataF8.Text;

      if FOficinaParam.RGPreview.ItemIndex = 0 then
         FRMapaVendaOficina.QRPrimario.Preview
      else
         FRMapaVendaOficina.QRPrimario.Print;
      QRMapaVendaOficina.Close;
    end;
  end;
end;

procedure TFMenuOficina.AtualizaEstoqueCusto1Click(Sender: TObject);
begin
  inherited;
  if FOFI0002 = nil then
    FOFI0002:= TFOFI0002.Create(Application);
  DMTela.VerificaTela(pModulo,FOFI0002.Caption,FOFI0002.Name);
  FOFI0002.ShowModal;
end;

procedure TFMenuOficina.Vendasliquidas1Click(Sender: TObject);
var wTVendasLiquidas_Custo_Vendedor, wTotalVendasLiquidas_Vendedor : Real;
    wLpt_Nota : String;
    wCont : Byte;
    wVendedor: Integer;
begin
  inherited;
  if FOficinaParam = nil then
     FOficinaParam:= TFOficinaParam.Create(Application);

  FOficinaParam.PGRelatorio.Pages[8].TabVisible := True;

  if FOficinaParam.ShowModal = mrOk then
  begin
    if (Trim(FOficinaParam.MEDataI9.Text) = '') or (Trim(FOficinaParam.MEDataF9.Text) = '') then
       raise exception.Create('Periodo deve ser informado!');
    with DMOficina_Relatorio do
      if FOficinaParam.RGPreview.ItemIndex = 0 then      //Preview
      begin
        QRVendasLiquidasPeriodo.Close;
        if Trim(FOficinaParam.MECodFilial9.Text) = '' then
           QRVendasLiquidasPeriodo.SetVariable('COD_FILIAL',Null)
        else
           QRVendasLiquidasPeriodo.SetVariable('COD_FILIAL',FOficinaParam.MECodFilial9.Text);

        if Trim(FOficinaParam.MECodVendedor9.Text) = '' then
          QRVendasLiquidasPeriodo.SetVariable('COD_VENDEDOR',Null)
        else
          QRVendasLiquidasPeriodo.SetVariable('COD_VENDEDOR',FOficinaParam.MECodVendedor9.Text);

        QRVendasLiquidasPeriodo.SetVariable('DT_EMISSAO_I',FOficinaParam.MEDataI9.Text);
        QRVendasLiquidasPeriodo.SetVariable('DT_EMISSAO_F',FOficinaParam.MEDataF9.Text);
        QRVendasLiquidasPeriodo.Open;

        if FRVendasLiquidasPeriodo = nil then
          FRVendasLiquidasPeriodo := TFRVendasLiquidasPeriodo.Create(Application);
        FRVendasLiquidasPeriodo.QRLFilial.Caption := FOficinaParam.MEDescFilial9.Text;
        FRVendasLiquidasPeriodo.QRLPeriodo.Caption := FOficinaParam.MEDataI9.Text + ' até ' + FOficinaParam.MEDataF9.Text;
        FRVendasLiquidasPeriodo.QRPrimario.Preview;
      end
      else
      begin                                               //Print
        QRVendasLiquidas_Oficina.Close;
        if Trim(FOficinaParam.MECodFilial9.Text) = '' then
           QRVendasLiquidas_Oficina.SetVariable('COD_FILIAL',Null)
        else
           QRVendasLiquidas_Oficina.SetVariable('COD_FILIAL',FOficinaParam.MECodFilial9.Text);
        if Trim(FOficinaParam.MECodVendedor9.Text) = '' then
           QRVendasLiquidas_Oficina.SetVariable('COD_VENDEDOR',Null)
        else
           QRVendasLiquidas_Oficina.SetVariable('COD_VENDEDOR',FOficinaParam.MECodVendedor9.Text);
        QRVendasLiquidas_Oficina.SetVariable('DT_EMISSAO_I',FOficinaParam.MEDataI9.Text);
        QRVendasLiquidas_Oficina.SetVariable('DT_EMISSAO_F',FOficinaParam.MEDataF9.Text);
        QRVendasLiquidas_Oficina.Open;

        // Venda Balcao \\

        QRVendasLiquidas_Balcao.Close;
        if Trim(FOficinaParam.MECodFilial9.Text) = '' then
           QRVendasLiquidas_Balcao.SetVariable('COD_FILIAL',Null)
        else
           QRVendasLiquidas_Balcao.SetVariable('COD_FILIAL',FOficinaParam.MECodFilial9.Text);
        if Trim(FOficinaParam.MECodVendedor9.Text) = '' then
           QRVendasLiquidas_Balcao.SetVariable('COD_VENDEDOR',Null)
        else
           QRVendasLiquidas_Balcao.SetVariable('COD_VENDEDOR',FOficinaParam.MECodVendedor9.Text);
        QRVendasLiquidas_Balcao.SetVariable('DT_EMISSAO_I',FOficinaParam.MEDataI9.Text);
        QRVendasLiquidas_Balcao.SetVariable('DT_EMISSAO_F',FOficinaParam.MEDataF9.Text);
        QRVendasLiquidas_Balcao.Open;

        QRVendasLiquidas_Custo_O.Close;
        if Trim(FOficinaParam.MECodVendedor9.Text) = '' then
           QRVendasLiquidas_Custo_O.SetVariable('COD_VENDEDOR',Null)
        else
           QRVendasLiquidas_Custo_O.SetVariable('COD_VENDEDOR',FOficinaParam.MECodVendedor9.Text);
        QRVendasLiquidas_Custo_O.SetVariable('DT_EMISSAO_I',FOficinaParam.MEDataI9.Text);
        QRVendasLiquidas_Custo_O.SetVariable('DT_EMISSAO_F',FOficinaParam.MEDataF9.Text);
        QRVendasLiquidas_Custo_O.Open;

        QRVendasLiquidas_Custo_B.Close;
        if Trim(FOficinaParam.MECodVendedor9.Text) = '' then
           QRVendasLiquidas_Custo_B.SetVariable('COD_VENDEDOR',Null)
        else
           QRVendasLiquidas_Custo_B.SetVariable('COD_VENDEDOR',FOficinaParam.MECodVendedor9.Text);
        QRVendasLiquidas_Custo_B.SetVariable('DT_EMISSAO_I',FOficinaParam.MEDataI9.Text);
        QRVendasLiquidas_Custo_B.SetVariable('DT_EMISSAO_F',FOficinaParam.MEDataF9.Text);
        QRVendasLiquidas_Custo_B.Open;

        if (QRVendasLiquidas_Balcao.RecordCount = 0) and
           (QRVendasLiquidas_Oficina.RecordCount = 0) then
           raise exception.Create('Não foi encontrado registros para impressão do relatório!');

        // Inicia impressão do relatório.

        // inicia servico de impressao.
        wLpt_Nota:= '';

        if Trim(FOficinaParam.MECodFilial9.Text) <> '' then
           wLpt_Nota:= DMOracle.BuscaNome('SELECT DESC_LPT_OS FROM TB_FILIAL','COD_FILIAL = '+FOficinaParam.MECodFilial9.Text);

        if Trim(wLpt_Nota) = '' then
           wLpt_Nota:= 'LPT1';

        if Imp = nil then
           Imp := TImp.Create;
        if Trim(wLpt_Nota) = 'LPT1' then
           Imp.AbreImpressora
        else
           if Trim(wLpt_Nota) = 'LPT2' then
              Imp.AbreImpressora_Lpt2
           else
             Imp.AbreImpressora_Com2;

        Imp.ConfiguraImpressora('CONDENSADO_ON','SEXTOS',66);

        QVendedorCons_Oficina.Close;
        if Trim(FOficinaParam.MECodVendedor9.Text) = '' then
           QVendedorCons_Oficina.SetVariable('COD_VENDEDOR',Null)
        else
           QVendedorCons_Oficina.SetVariable('COD_VENDEDOR',FOficinaParam.MECodVendedor9.Text);

        QVendedorCons_Oficina.Open;

        wVendedor:=0;                  // inializa valor da variavel para quebra do grupo.
        wTVendasLiquidas_Custo_Vendedor:= 0;
        wTotalVendasLiquidas_Vendedor:= 0;
        wCont := 2;                   // Inicializa valor da linha.

        while not QVendedorCons_Oficina.Eof do
        begin
          if wCont = 2 then
          begin
            Imp.WriteXY(17.3,wCont,DateTimeToStr(Now));
            wCont := wCont+2;
            Imp.WriteXY( 4.2,wCont,'---------------------------------------------------------------');
            Inc(wCont);
            Imp.WriteXY( 4.2,wCont,'VENDAS LIQUIDAS PRATICADAS NO PERIODO ' +FOficinaParam.MEDataI9.Text+' A '+FOficinaParam.MEDataF9.Text);
            wCont := wCont+2;
            if Trim(FOficinaParam.MECodFilial9.Text) = '' then
               Imp.WriteXY( 4.2,wCont,'FILIAL: TODAS')
            else
               Imp.WriteXY( 4.2,wCont,'FILIAL: '+FOficinaParam.MECodFilial9.Text+'-'+FOficinaParam.MEDescFilial9.Text);
            Inc(wCont);
            Imp.WriteXY( 4.2,wCont,'---------------------------------------------------------------');
            wCont:= wCont+2;
          end;
          if wVendedor <> QVendedorCons_OficinaCOD_VENDEDOR.Value then
          begin
            wCont := wCont+1;
            Imp.WriteXY( 0.2,wCont,Trim(QVendedorCons_OficinaCOD_VENDEDOR.Text)+': '+QVendedorCons_OficinaNOME.Value);
            wCont := wCont+1;
            Imp.WriteXY( 0.2,wCont,'-------------------------------------------------------------------------------------------------------------------------------------');
            wCont := wCont+1;
            wVendedor:= QVendedorCons_OficinaCOD_VENDEDOR.Value;
          end;
          // Pega total vendas do vendedor no balcao
          QRVendasLiquidas_Balcao.First;
          while not QRVendasLiquidas_Balcao.Eof do
          begin
            if wVendedor = QRVendasLiquidas_BalcaoCOD_VENDEDOR.Value then
               wTotalVendasLiquidas_Vendedor:=wTotalVendasLiquidas_Vendedor+QRVendasLiquidas_BalcaoTOTAL_VENDA_BALCAO.Value;
            QRVendasLiquidas_Balcao.Next;
          end;
          // Pega total vendas do vendedor no oficina
          QRVendasLiquidas_Oficina.First;
          while not QRVendasLiquidas_Oficina.Eof do
          begin
            if wVendedor = QRVendasLiquidas_OficinaCOD_VENDEDOR.Value then
               wTotalVendasLiquidas_Vendedor:=wTotalVendasLiquidas_Vendedor+QRVendasLiquidas_OficinaTOTAL_PECAS_OS.Value;
            QRVendasLiquidas_Oficina.Next;
          end;

          if wTotalVendasLiquidas_Vendedor > 0 then
          begin
            // Pega total custo das vendas do vendedor na oficina
            QRVendasLiquidas_Custo_O.First;
            while not QRVendasLiquidas_Custo_O.Eof do
            begin
              if wVendedor = QRVendasLiquidas_Custo_OCOD_VENDEDOR.Value then
                 wTVendasLiquidas_Custo_Vendedor:=wTVendasLiquidas_Custo_Vendedor+QRVendasLiquidas_Custo_OT_CUSTO_OS.Value;
              QRVendasLiquidas_Custo_O.Next;
            end;

            // Pega total custo das vendas do vendedor no balcao
            QRVendasLiquidas_Custo_B.First;
            while not QRVendasLiquidas_Custo_B.Eof do
            begin
              if wVendedor = QRVendasLiquidas_Custo_BCOD_VENDEDOR.Value then
                 wTVendasLiquidas_Custo_Vendedor:=wTVendasLiquidas_Custo_Vendedor+QRVendasLiquidas_Custo_BTOTAL_VENDA_BALCAO.Value;
              QRVendasLiquidas_Custo_B.Next;
            end;

            Imp.WriteXY( 2.9,wCont,'(+) FATURAMENTO BRUTO');
            Imp.WriteXY(10.3,wCont,Bib.NumToTexto(wTotalVendasLiquidas_Vendedor,2,11));
            wCont := wCont+1;
            Imp.WriteXY( 3.2,wCont,'(-) ICMS s/VENDAS');
            Imp.WriteXY(10.3,wCont,Bib.NumToTexto(wTotalVendasLiquidas_Vendedor*17/100,2,11));
            wCont := wCont+1;
            Imp.WriteXY( 3.2,wCont,'(-) DARF 5,8%');
            Imp.WriteXY(10.3,wCont,Bib.NumToTexto((wTotalVendasLiquidas_Vendedor*5.8/100),2,11));
            wCont := wCont+1;
            Imp.WriteXY( 3.2,wCont,'(-) CUSTO DAS VENDAS');
            Imp.WriteXY(10.3,wCont,Bib.NumToTexto((wTVendasLiquidas_Custo_Vendedor),2,11));
            wCont := wCont+1;
            Imp.WriteXY( 2.9,wCont,'LUCRO BRUTO');
            Imp.WriteXY(10.3,wCont,Bib.NumToTexto(wTotalVendasLiquidas_Vendedor-((wTotalVendasLiquidas_Vendedor*17/100)+
                                                 (wTotalVendasLiquidas_Vendedor*5.8/100)+wTVendasLiquidas_Custo_Vendedor),2,11));
            wCont := wCont+1;
          end;

          wVendedor:=0;
          wTotalVendasLiquidas_Vendedor:= 0;
          wTVendasLiquidas_Custo_Vendedor:=0;
          QVendedorCons_Oficina.Next;
          if wCont >= 52 then
          begin
            Imp.SaltaPagina;
            wCont:=2;
          end;
        end;
        // Fecha impressora e fecha query aberta.
        QVendedorCons_Oficina.Close;
        QRVendasLiquidas_Custo_O.Close;
        QRVendasLiquidas_Custo_B.Close;
        QRVendasLiquidas_Oficina.Close;
        QRVendasLiquidas_Balcao.Close;
        Imp.FechaImpressora;
      end;
  end;
end;

procedure TFMenuOficina.Produtoscomcustozero01Click(Sender: TObject);
begin
  inherited;
  with DMOficina_Relatorio do
  begin
    QRProdutoCustoZero.Close;
    QRProdutoCustoZero.Open;
    if FRProdutoSemCusto = nil then
       FRProdutoSemCusto := TFRProdutoSemCusto.Create(Application);
    FRProdutoSemCusto.Preview;
    QRProdutoCustoZero.Close;
  end;
end;

procedure TFMenuOficina.EtiquetaCdigobarraNF1Click(Sender: TObject);
var wQtd : integer;
begin
  inherited;

  if FOficinaParam = nil then
     FOficinaParam := TFOficinaParam.Create(Self);

  FOficinaParam.PGRelatorio.Pages[9].TabVisible := True;

  if FOficinaParam.ShowModal = mrOk then
  begin
    with DMOficina_Relatorio do
    begin
      QEtiquetaCodigoBarra.Close;
      QEtiquetaCodigoBarra.open;
      if QEtiquetaCodigoBarra.RecordCount > 0 then
      begin
        QEtiquetaCodigoBarra.First;
        while not QEtiquetaCodigoBarra.Eof do
        begin
          QEtiquetaCodigoBarra.Delete;
        end;
      end;

      QREtiquetaCodBarraNF.Close;
      QREtiquetaCodBarraNF.SetVariable('COD_NOTA_CAB',FOficinaParam.EdCod_nota_cab.Text);
      QREtiquetaCodBarraNF.Open;
      QREtiquetaCodBarraNF.First;
      while not QREtiquetaCodBarraNF.Eof do
      begin
        wQtd := StrToInt(QREtiquetaCodBarraNFQT_QUANTIDADE.Text);
        while wQtd > 0 do
        begin
          QEtiquetaCodigoBarra.Append;
          QEtiquetaCodigoBarraETIQUETA1.Value:= QREtiquetaCodBarraNFNUM_FABRICANTE.Value;
          QEtiquetaCodigoBarraETIQUETA2.Value:= QREtiquetaCodBarraNFNUM_FABRICANTE.Value;
          QEtiquetaCodigoBarraETIQUETA3.Value:= QREtiquetaCodBarraNFNUM_FABRICANTE.Value;
          QEtiquetaCodigoBarra.Post;
          wQtd:=wQtd-3;
        end;
        QREtiquetaCodBarraNF.Next;
      end;

      QEtiquetaCodigoBarra.Close;
      QEtiquetaCodigoBarra.Open;

      if FREtiquetaCodBarraNF = nil then
         FREtiquetaCodBarraNF := TFREtiquetaCodBarraNF.Create(Application);

      if FOficinaParam.RGPreview.ItemIndex = 0 then
         FREtiquetaCodBarraNF.QRPrimario.preview
      else
         FREtiquetaCodBarraNF.QRPrimario.Print;

    end;
  end;
end;

procedure TFMenuOficina.Iniciarmarcao1Click(Sender: TObject);
begin
  inherited;
  if FOFI0010 = nil then
    FOFI0010:= TFOFI0010.Create(Application);
  DMTela.VerificaTela(pModulo,FOFI0010.Caption,FOFI0010.Name);
  FOFI0010.ShowModal;
end;

procedure TFMenuOficina.Finalizarmarcao1Click(Sender: TObject);
begin
  inherited;
  if FMarcacaoFinalizar = nil then
     FMarcacaoFinalizar := TFMarcacaoFinalizar.Create(Application);
  DMTela.VerificaTela(pModulo,FMarcacaoFinalizar.Caption,FMarcacaoFinalizar.Name);
  FMarcacaoFinalizar.ShowModal;
end;

procedure TFMenuOficina.Vendasavistabalco1Click(Sender: TObject);
begin
  inherited;
  if FOficinaParam = nil then
     FOficinaParam := TFOficinaParam.Create(Application);

  FOficinaParam.PGRelatorio.Pages[10].TabVisible := True;

  if FOficinaParam.ShowModal = mrOk then
  begin
    if ( Trim(FOficinaParam.MEDtMovimentoI11.Text) = '' ) or ( Trim(FOficinaParam.MEDtMovimentoF11.Text) = '' ) then
       raise exception.Create('Periodo de Movimento deve ser informado!');

    with DMOficina_Relatorio do
    begin
      QRVendaAvistaBalcao.Close;
      QRVendaAvistaBalcao.SetVariable('dt_movimento_i',FOficinaParam.MEDtMovimentoI11.Text);
      QRVendaAvistaBalcao.SetVariable('dt_movimento_f',FOficinaParam.MEDtMovimentoF11.Text);
      if Trim(FOficinaParam.MECodFilial11.Text) = '' then
         QRVendaAvistaBalcao.SetVariable('cod_filial',Null)
      else
         QRVendaAvistaBalcao.SetVariable('cod_filial',FOficinaParam.MECodFilial11.Text);
      QRVendaAvistaBalcao.open;

      if FRVendaAvistaBalcao = nil then
         FRVendaAvistaBalcao := TFRVendaAvistaBalcao.Create(Application);

      FRVendaAvistaBalcao.QRLTitulo.Caption :=
      FRVendaAvistaBalcao.QRLTitulo.Caption + ' Periodo : '+FOficinaParam.MEDtMovimentoI11.Text+' A '+FOficinaParam.MEDtMovimentoF11.Text;
      if FOficinaParam.RGPreview.ItemIndex = 0 then
         FRVendaAvistaBalcao.QRPrimario.Preview
      else
         FRVendaAvistaBalcao.QRPrimario.Print;
      QRVendaAvistaBalcao.Close;
    end;
  end;
end;

procedure TFMenuOficina.RelInvetrioPeas1Click(Sender: TObject);
begin
  inherited;
  if FOficinaParam = nil then
     FOficinaParam := TFOficinaParam.Create(Application);
  FOficinaParam.PGRelatorio.Pages[14].TabVisible := True;
  if FOficinaParam.ShowModal = mrOk then
  begin
    with DMOficina_Relatorio do
    begin
      QRPecasEstoque.Close;
      if Trim(FOficinaParam.ME15CodFilial.Text) = '' then
         QRPecasEstoque.SetVariable('COD_FILIAL',Null)
      else
         QRPecasEstoque.SetVariable('COD_FILIAL',FOficinaParam.ME15CodFilial.Text);
      QRPecasEstoque.open;
      if(FRPecasEstoque = nil) then
        FRPecasEstoque := TFRPecasEstoque.create(Application);
      FRPecasEstoque.QRLFilial.Caption:=FOficinaParam.ME15DescFilial.Text;

      if FOficinaParam.RGPreview.ItemIndex = 0 then
         FRPecasEstoque.QRPrimario.Preview
      else
         FRPecasEstoque.QRPrimario.Print;
      QRPecasEstoque.Close;
    end;
  end;
end;

procedure TFMenuOficina.ReldePeasOEMemEstoque1Click(Sender: TObject);
begin
  inherited;
  if FOficinaParam = nil then
     FOficinaParam := TFOficinaParam.Create(Application);
  FOficinaParam.PGRelatorio.Pages[14].TabVisible := True;
  if FOficinaParam.ShowModal = mrOk then
  begin
    with DMOficina_Relatorio do
    begin
      QRPecasOEMEstoque.Close;
      if Trim(FOficinaParam.ME15CodFilial.Text) = '' then
         QRPecasOEMEstoque.SetVariable('COD_FILIAL',Null)
      else
         QRPecasOEMEstoque.SetVariable('COD_FILIAL',FOficinaParam.ME15CodFilial.Text);
      QRPecasOEMEstoque.open;
      if(FRPecasOEMEstoque = nil) then
        FRPecasOEMEstoque := TFRPecasOEMEstoque.create(Application);
      FRPecasOEMEstoque.QRLFilial.Caption:=FOficinaParam.ME16DescFilial.Text;

      if FOficinaParam.RGPreview.ItemIndex = 0 then
         FRPecasOEMEstoque.QRPrimario.Preview
      else
         FRPecasOEMEstoque.QRPrimario.Print;
      QRPecasOEMEstoque.Close;
    end;
  end;
end;

procedure TFMenuOficina.ImpFormulrioContagem1Click(Sender: TObject);
begin
  inherited;
    with DMOficina_Relatorio do
    begin
      QRContagemPecas.Close;
      QRContagemPecas.open;
      if(FRPecasEstoque = nil) then
        FRContagemPecas := TFRContagemPecas.create(Application);
      FRContagemPecas.QRPrimario.Preview;
      QRPecasEstoque.Close;
    end;
end;

procedure TFMenuOficina.RelAcertosdeEstoque1Click(Sender: TObject);
begin
  inherited;
  if FOficinaParam = nil then
     FOficinaParam := TFOficinaParam.Create(Application);
  FOficinaParam.PGRelatorio.Pages[18].TabVisible := True;
  if FOficinaParam.ShowModal = mrOk then
  begin
    with DMOficina_Relatorio do
    begin
      QRControleEstoque.Close;
      if ((Trim(FOficinaParam.ME18DTInicial.Text) = '') or (Trim(FOficinaParam.ME18DTFinal.Text) = '')) then
        Raise Exception.Create('Informe a data!')
      else
      Begin
        QRControleEstoque.SetVariable('DT_INICIAL',FOficinaParam.ME18DtInicial.Text);
        QRControleEstoque.SetVariable('DT_FINAL',FOficinaParam.ME18DtFinal.Text);
      end;

      QRControleEstoque.open;
      if(FRControleEstoque = nil) then
        FRControleEstoque := TFRControleEstoque.create(Application);

      if FOficinaParam.RGPreview.ItemIndex = 0 then
         FRControleEstoque.QRPrimario.Preview
      else
         FRControleEstoque.QRPrimario.Print;
      QRControleEstoque.Close;
    end;
  end;
end;

procedure TFMenuOficina.FormActivate(Sender: TObject);
begin
  Veculos1.Caption := '&Veículos';
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'INJEPAR' then
  begin
    MMCadSimples.Items[1].Visible := False;
    MMCadSimples.Items[0].Items[0].Visible := False;
    MMCadSimples.Items[0].Items[3].Visible := False;
    MMCadSimples.Items[0].Items[4].Visible := False;
    MMCadSimples.Items[0].Items[5].Visible := False;
    MMCadSimples.Items[0].Items[6].Visible := False;
    MMCadSimples.Items[0].Items[7].Visible := False;
    MMCadSimples.Items[0].Items[8].Visible := False;
    MMCadSimples.Items[0].Items[9].Visible := False;
    MMCadSimples.Items[0].Items[10].Visible := False;
    MMCadSimples.Items[0].Items[11].Visible := False;
    MMCadSimples.Items[0].Items[12].Visible := False;
    MMCadSimples.Items[0].Items[13].Visible := False;
    MMCadSimples.Items[0].Items[14].Visible := False;
    MMCadSimples.Items[0].Items[15].Visible := False;
  end
  else
  begin
    MMCadSimples.Items[0].Items[16].Visible := False;
    MMCadSimples.Items[0].Items[17].Visible := False;
  end;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS' then
    Veculos1.Caption := '&Equipamento';
end;

procedure TFMenuOficina.OrdemServio1Click(Sender: TObject);
begin
  inherited;
  if FOficinaCad = nil then
    FOficinaCad := TFOficinaCad.Create(Application);
  DMTela.VerificaTela(pModulo,FOficinaCad.Caption,FOficinaCad.Name);
  FOficinaCad.ShowModal;
end;

procedure TFMenuOficina.Oramento1Click(Sender: TObject);
begin
  inherited;
  if FOficinaOrcamento = nil then
    FOficinaOrcamento := TFOficinaOrcamento.Create(Application);
  DMTela.VerificaTela(pModulo,FOficinaOrcamento.Caption,FOficinaOrcamento.Name);
  FOficinaOrcamento.ShowModal;
end;

procedure TFMenuOficina.RelQtdedePeasComOSAberta1Click(Sender: TObject);
begin
  if FOficinaParam = nil then
     FOficinaParam := TFOficinaParam.Create(Application);
  FOficinaParam.PGRelatorio.Pages[25].TabVisible := True;
  if FOficinaParam.ShowModal = mrOk then
  begin
    with DMOficina_Relatorio do
    begin
      QRQtdePecasOSAbertas.Close;
      if Trim(FOficinaParam.Fm25Produto.MeProduto.Text) <> '' then
        QRQtdePecasOSAbertas.SetVariable('COD_PRODUTO',StrToInt(Trim(FOficinaParam.Fm25Produto.MeProduto.Text)))
      else
        QRQtdePecasOSAbertas.SetVariable('COD_PRODUTO', NULL);
      if Trim(FOficinaParam.ME25OS.Text) <> '' then
        QRQtdePecasOSAbertas.SetVariable('NUM_OS', StrToInt(Trim(FOficinaParam.ME25OS.Text)))
      else
        QRQtdePecasOSAbertas.SetVariable('NUM_OS', NULL);

      QRQtdePecasOSAbertas.Open;
      if(FRQtdePecasOSAbertas = nil) then
        FRQtdePecasOSAbertas := TFRQtdePecasOSAbertas.create(Application);
      FRQtdePecasOSAbertas.QRLTitulo.Caption := 'Relatório de Quantidades de peças nas requisições com O.S. em aberto.';
      if FOficinaParam.RGPreview.ItemIndex = 0 then
         FRQtdePecasOSAbertas.QRPrimario.Preview
      else
         FRQtdePecasOSAbertas.QRPrimario.Print;
      QRQtdePecasOSAbertas.Close;
    end;
  end;
end;

procedure TFMenuOficina.Requisio2Click(Sender: TObject);
begin
  inherited;
  if FRequisicaoCad2 = Nil then
    FRequisicaoCad2 := TFRequisicaoCad2.Create(Application);
  DMTela.VerificaTela(pModulo,FRequisicaoCad2.Caption,FRequisicaoCad2.Name);
  FRequisicaoCad2.ShowModal();
end;

end.

